{ ... }:
{
  programs.kitty = {
    enable = true;
    environment = {
      "EDITOR" = "nvim";
    };
    font = {
      name = "Hack Nerd Font Mono Bold";
      size = 11;
    };
    themeFile = "Glacier";

    settings = {
      confirm_os_window_close = 0;
    };
  };
}
