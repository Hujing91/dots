{
  description = "nix configurations";

  inputs = {
    hardware.url = "github:NixOS/nixos-hardware/master";
    home = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, hardware, home, nixpkgs, ... }:
    let
      user = "hujing";
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
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
      };
    };
}
