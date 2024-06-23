{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "NitroSniper";
    userEmail = "mahiemiah35@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  home.packages = with pkgs; [
    # Formatters
    nixfmt-rfc-style
    jq
    ruff

    # Toolchains
    rustup
    gcc
  ];
}
