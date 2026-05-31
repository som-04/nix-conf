{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     lanzaboote = {
           url = "github:nix-community/lanzaboote/v1.0.0";


           inputs.nixpkgs.follows = "nixpkgs";
         };

  };

  outputs = { self, nixpkgs , lanzaboote, ... }@inputs: {
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
        # lanzaboote
        lanzaboote.nixosModules.lanzaboote
        ({ pkgs, lib, ... }: {

          environment.systemPackages = [

            pkgs.sbctl
          ];


          boot.loader.systemd-boot.enable = lib.mkForce false;

          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
          };
        })

      ];
    };
  };
}
