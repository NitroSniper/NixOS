{ ... }:
{
  programs =
    let
      enable = true;
      enableBashIntegration = true;
    in
    {
      yazi = {
        inherit enableBashIntegration enable;
      };
      zoxide = {
        inherit enableBashIntegration enable;
      };
    };
}
