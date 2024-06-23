{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.portscanners;
in
{
  options.home.components.portscanners.enable = mkEnableOption "portscanners";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #arp-scan
        #das
        ipscan
        masscan
        #naabu
        nmap # ncat should be included
        #udpx
        #sx-go
        #rustscan
        zmap
      ];
    };
  };
}