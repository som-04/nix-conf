{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };


  };

  outputs = { self, nixpkgs ,... }@inputs: {
    overlays.default = (final: prev: {
          openldap = prev.openldap.overrideAttrs (old: {
            doCheck = false;
          });
        });
    nixosConfigurations.som = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ self.overlays.default ]; })
        ./hosts/som/configuration.nix
        inputs.home-manager.nixosModules.default


      ];
    };
  };
}
