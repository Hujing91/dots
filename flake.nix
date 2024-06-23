{
  description = "nix configurations";

  inputs = {
    hardware.url = "github:NixOS/nixos-hardware/master";
    home = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    yeet = {
      url = "github:aserowy/yeet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, hardware, home, nixpkgs, yeet, ... }:
    let
      user = "hujing";
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [
                #neocode.overlays.default
                yeet.overlays.default
              ];
            }

            ./systems/desktop
            {
              imports = [ ./users ];

              users.${user} = {
                enable = true;
              };
            }
            
            home.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit user; };
              home-manager.users."${user}" = import ./home/desktop.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

        alienware = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [
                #neocode.overlays.default
                yeet.overlays.default
              ];
            }

            ./systems/alienware
            {
              imports = [ ./users ];

              users.${user} = {
                enable = true;
              };
            }
            
            home.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit user; };
              home-manager.users."${user}" = import ./home/desktop.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
