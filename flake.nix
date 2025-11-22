{
  description = "My personal dotfiles as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        # system config
        ./nixos/configuration.nix

        # Stylix system-level theming
        stylix.nixosModules.stylix

        # Home Manager as a NixOS module
        home-manager.nixosModules.home-manager

        # Home Manager settings + home.nix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.caroccp = import ./home/default.nix;

          # Optional: pass flake inputs to home.nix if needed
          # home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}

