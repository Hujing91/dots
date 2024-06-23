{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.network;
in
{
  options.home.components.network.enable = mkEnableOption "network";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #arping
        #arpoison
        #atftp
        #bandwhich
        #bngblaster
        crackmapexec
        #evillimiter
        #iperf2
        #iputils
        #lftp
        #mitm6
        #mtr
        #ncftp
        #netcat-gnu
        #netdiscover
        #netexec
        #nload
        #nuttcp
        #pingu
        #putty
        #pwnat
        #responder
        #route-graph
        #rustcat
        #sshping
        #sslh
        #tunnelgraf
        #wbox
        #whois
        #yersinia
      ];
    };
  };
}