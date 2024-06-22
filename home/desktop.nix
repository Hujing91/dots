{ pkgs, home-manager, ... }:
{
  imports = [
    ./base.nix
  ];

  home = {
    components = {
      alacritty.enable = true;

      # NOTE: fallback terminal
      foot.enable = true;

      fuzzers.enable = true;
      logseq.enable = true;
      password.enable = true;
      portscanners.enable = true;
      proxies.enable = true;
      services.enable = true;
      swww.enable = true;
      traffic.enable = true;
      web.enable = true;
    };

    modules = {
      gtk.enable = true;
      sway.enable = true;
      #xdg.enable = true;
    };

    packages = with pkgs; [
      discord
      teams-for-linux
      vmware-horizon-client
      obsidian
      curl
      cyberchef
      nano
      parted
      btop              # Ressource Manager

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