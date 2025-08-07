# flake.nix

{
  description = "Nixos config flake";

  inputs = {
    # Change this from "nixos-unstable" to the stable channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
       # Change this to the corresponding stable release
       url = "github:nix-community/home-manager/release-25.05";
       inputs.nixpkgs.follows = "nixpkgs"; # This part is correct
     };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
