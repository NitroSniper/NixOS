{ pkgs, ... }:
let
  flake-target = ".#default";
  rebuild-nix = pkgs.writeShellScriptBin "rebuild-nixos" ''
    # A rebuild script that commits on a successful build
    set -e

    # cd to your config dir
    pushd ~/nixos/


    # Edit your config and If you quit Neovim via :cq then it won't rebuild
    if [ $EDITOR . -ne 0 ]; then
      echo "Cancelling rebuild step..."
      exit 1
    fi

    # Print a git diff of changes. 
    git diff -U0 '*.nix'

    # Add any files not tracked by git
    git add *

    if [ nixfmt --check --quiet . -ne 0]; then
      echo "Nix files not formatted. Formatting now..."
      nixfmt --quiet . || ( nixfmt . ; echo "formatting failed!" && exit 1)
    fi

    echo "NixOS Rebuilding... with Flake Option: ${flake-target}"

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch --flake ${flake-target} &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

    current=$(nixos-rebuild list-generations | rg current)
    git commit -am "$current"

    popd
    hyprctl notify -q 5 5000 00000000 New NixOS config has been rebuilt successfully!
  '';
in
{
  home.packages = [
    rebuild-nix
    pkgs.ripgrep # Needed for runtime of rebuild
  ];
}
