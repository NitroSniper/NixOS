{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Needed for telescope search
  home.packages = [ pkgs.ripgrep ];
}
