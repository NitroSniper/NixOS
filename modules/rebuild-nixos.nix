{ pkgs, ... }:
let
  flake-target = ".#default";
  config-location = "~/nixos/";
  rebuild-nix = pkgs.writeShellScriptBin "rebuild-nixos" ''
    # A rebuild script that commits on a successful build

    # cd to your config dir
    pushd ${config-location}

    # Edit your config via default editor
    $EDITOR .

    # If you quit Neo/vim via :cq then it will activate the rebuild step
    # I'm doing this because doing :wq is ingrained into my muscle and I will accidentally rebuild
    if [ $? -eq 0 ]; then
      echo "Skipping rebuild step... If using Neo/vim, quit via :cq" && exit 1
    fi

    if git diff --quiet .; then
      echo "No changes detected, exiting." && exit 0
    fi

    # Print a git diff of changes. 
    git diff -U0 '*.nix'

    nixfmt --check --quiet . 
    if [ $? -ne 0 ]; then
      echo "Nix files not formatted. Formatting now..."
      nixfmt --quiet . || ( nixfmt . ; echo "formatting failed!" && exit 1)
    fi

    # Add any files not tracked by git
    echo "Adding all files in ${config-location} to git"
    git add *

    echo "NixOS Rebuilding... with Flake Option: ${flake-target}"

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch --flake ${flake-target} |& tee nixos-switch.log || (cat nixos-switch.log | rg --color error && exit 1)

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
