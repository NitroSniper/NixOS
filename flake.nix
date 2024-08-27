{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My own Dev Tooling
    nox = {
      url = "github:NitroSniper/nox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixpkgs.overlays = [ (final: prev: { nox = inputs.nox.packages.${final.system}.default; }) ];
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/nixos/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
