{
  description = "A template that shows all standard flake outputs";

  inputs = {
	#nixos official package source
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  };
  outputs = {self, nixpkgs, ...}@inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	  modules = [
	  # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix
      ];
    };
  };
}
