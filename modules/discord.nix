{ pkgs, ... }:
{
  home.packages = [
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    pkgs.vesktop
  ];

}
