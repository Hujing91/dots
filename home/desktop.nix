{ pkgs, home-manager, ... }:
{
  imports = [
    ./base.nix
  ];

  home = {
    components = {
      alacritty.enable = true;
      firefox.enable = true;

      # NOTE: fallback terminal
      foot.enable = true;

      logseq.enable = true;
      swww.enable = true;
    };

    modules = {
      cybersecurity.enable = true;
      gtk.enable = true;
      sway.enable = true;
      #hyprland.enable = true;
      #xdg.enable = true; # xdg crashes home-manager stable version 24.05 Why?
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
      lshw

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