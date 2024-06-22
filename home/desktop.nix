{ pkgs, home-manager, ... }:
{
  imports = [
    ./base.nix
    ./pentestBase.nix
  ];

  home = {
    components = {
      alacritty.enable = true;

      # NOTE: fallback terminal
      foot.enable = true;

      logseq.enable = true;
      swww.enable = true;
    };

    modules = {
      gtk.enable = true;
      #sway.enable = true;
      #xdg.enable = true;
    };

    packages = with pkgs; [
      discord
      teams-for-linux
      vmware-horizon-client
      obsidian

      (lutris.override {
        extraLibraries =  pkgs: [
          # List library dependencies here
        ];
        extraPkgs = pkgs: [
          winePackages.staging
          wine64Packages.staging
        ];
      })
    ];
  };
}