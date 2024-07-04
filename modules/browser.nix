{ pkgs, ... }:
{
  home.packages = with pkgs; [
    floorp
    ungoogled-chromium
  ];
}
