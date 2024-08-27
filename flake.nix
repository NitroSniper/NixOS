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

    # Neovim config not managed via nix for portability
    neovim-ortin = {
      url = "github:NitroSniper/neovim";
      flake = false;
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
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
