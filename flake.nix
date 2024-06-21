{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      user = "hujing";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit user inputs; };
          modules = [
            ./systems/desktop
            {
              imports = [ ./users ];

              users.${user} = {
                enable = true;
              };
            }
            
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit user; };
              home-manager.users."${user}" = {
                imports = [(import ./home/desktop.nix)];
              };
            }
          ];
        };
      };
    };
}
