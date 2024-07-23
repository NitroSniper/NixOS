{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "NitroSniper";
    userEmail = "mahiemiah35@gmail.com";
    extraConfig.init.defaultBranch = "main";
    aliases = {
      nuke = "reset --hard origin/main";
    };
  };

  home.packages = with pkgs; [
    # Formatters
    nixfmt-rfc-style
    jq
    ruff

    direnv
  ];
}
