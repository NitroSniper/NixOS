{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    environment = {
      "EDITOR" = "nvim";
    };
    font = {
      name = "Hack Nerd Font Mono Bold";
      size = 11;
    };
  };
}
