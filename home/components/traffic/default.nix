{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.traffic;
in
{
  options.home.components.traffic.enable = mkEnableOption "traffic";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #anevicon
        #dhcpdump
        #dnstop
        #driftnet
        #dsniff
        #goreplay
        #joincap
        #junkie
        #netsniff-ng
        #ngrep
        #secrets-extractor
        #sniffglue
        #tcpdump
        #tcpflow
        #tcpreplay
        #termshark
        wireshark
        #wireshark-cli
        #zeek
      ];
    };
  };
}