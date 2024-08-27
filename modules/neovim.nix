{ pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  # Grab my neovim config
  xdg.configFile.nvim.source = inputs.neovim-ortin;

  # Needed for telescope search
  home.packages = [ pkgs.ripgrep ];
}
