{ pkgs, ... }:
let
  flake-target = ".#default";
  rebuild-nix = pkgs.writeShellScriptBin "rebuild-nixos" ''
    # A rebuild script that commits on a successful build
    set -e

    # cd to your config dir
    pushd ~/nixos/

    # Edit your config
    $EDITOR .

    # If you quit Neovim via 
    if [ "$?" -ne 0 ]; then
      echo "Cancelling rebuild"
      exit 1
    fi

    # Print a git diff of changes. 
    git diff -U0 '*.nix'

    # Add any files not tracked by git
    git add *

    if nixfmt --check --quiet .; then
      echo "Nix files not formatted. Formatting now..."
      nixfmt --quiet . || ( nixfmt . ; echo "formatting failed!" && exit 1)
    fi


    echo "NixOS Rebuilding... with Flake Option: ${flake-target}"

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch --flake ${flake-target} &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

    current=$(nixos-rebuild list-generations | rg current)
    git commit -am "$current"

    popd
    hyprctl notify 5 5000 00000000 New NixOS config has been rebuilt successfully!
  '';
in
{
  home.packages = [
    rebuild-nix
    pkgs.ripgrep # Needed for runtime of rebuild
  ];
}
