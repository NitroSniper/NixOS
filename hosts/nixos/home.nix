{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nitro";
  home.homeDirectory = "/home/nitro";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ../../modules/neovim.nix
    ../../modules/hyprland.nix
    ../../modules/hyprlock.nix
    ../../modules/browser.nix
    ../../modules/discord.nix
    ../../modules/terminal.nix
    ../../modules/devtools.nix
    ../../modules/rofi.nix
    ../../modules/waybar.nix
    ../../modules/swaybar.nix
    ../../modules/kitty.nix
    ../../modules/rebuild-nixos.nix
    ../../modules/yazi.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    foliate
    obs-studio
    ticktick

    # Wayland Clipboard
    wl-clipboard
  ];

  systemd.user.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
