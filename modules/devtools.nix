{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "NitroSniper";
    userEmail = "mahiemiah35@gmail.com";
    extraConfig.init.defaultBranch = "main";
    aliases = {
      # Used first to remove git files back to remote
      nuke = "reset --hard origin/main";
      # Wipe any untracked files
      fallout = "clean --force";
      # Create a Git Repository intended with worktree
      seed = "clone --bare";
    };
  };

  home.packages = with pkgs; [
    # Formatters
    nixfmt-rfc-style
    nixd
  ];
}
