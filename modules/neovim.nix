{
  pkgs,
  inputs,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;
  };

  # Grab my neovim config
  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink inputs.neovim-ortin;

  # Needed for telescope search
  home.packages = [ pkgs.ripgrep ];
}
