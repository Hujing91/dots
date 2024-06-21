{ pkgs, home-manager, ... }:
{
  imports = [
    ./base.nix
  ];

  home = {
    #components = {
    #  alacritty.enable = true;
    #  chrome.enable = true;
    #  docker.enable = true;

      # NOTE: fallback terminal
    #  foot.enable = true;

    #  logseq.enable = true;
    #  onedrive.enable = true;
    #  swww.enable = true;
    #};

    modules = {
    #  gtk.enable = true;
      sway.enable = true;
    #  xdg.enable = true;
    };

    packages = with pkgs; [
      discord
      nerdfonts
      teams-for-linux
      vmware-horizon-client
    ];
  };
}