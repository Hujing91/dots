{ config, pkgs, user, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    discord
    nerdfonts
    teams-for-linux
    vmware-horizon-client
  ];
}
