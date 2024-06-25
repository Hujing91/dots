{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.virtmanager;
in
{
  options.home.components.virtmanager = {
    enable = mkEnableOption "virtmanager";
  };

  config = mkIf cnfg.enable {
    home = {
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;
      
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
            autoconnect = ["qemu:///system"];
            uris = ["qemu:///system"];
        };
      };
      
      users.users.hujing.extraGroups = [ "libvirtd" ];
    };
  };
}