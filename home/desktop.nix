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

    #modules = {
    #  gtk.enable = true;
    #  sway.enable = true;
    #  xdg.enable = true;
    #};

    packages = with pkgs; [
      discord
      nerdfonts
      teams-for-linux
      vmware-horizon-client
    ];
  };
}