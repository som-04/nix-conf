{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     lanzaboote = {
           url = "github:nix-community/lanzaboote/v0.4.2";

           # Optional but recommended to limit the size of your system closure.
           inputs.nixpkgs.follows = "nixpkgs";
         };

  };

  outputs = { self, nixpkgs, lanzaboote,... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
        lanzaboote.nixosModules.lanzaboote
        ({ pkgs, lib, ... }: {

                    environment.systemPackages = [
                      # For debugging and troubleshooting Secure Boot.
                      pkgs.sbctl
                    ];

                    # Lanzaboote currently replaces the systemd-boot module.
                    # This setting is usually set to true in configuration.nix
                    # generated at installation time. So we force it to false
                    # for now.
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
