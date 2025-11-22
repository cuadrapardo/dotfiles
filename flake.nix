{
  description = "My personal dotfiles as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }:
  {
    # Expose your NixOS configuration as a module
    nixosModules.default = ./nixos/configuration.nix;

    # Optional: provide home-manager modules, packages, etc.
    # homeModules.default = ./home/configuration.nix;
  };
}
