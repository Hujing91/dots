{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.osint;
in
{
  options.home.components.osint.enable = mkEnableOption "osint";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #spiderfoot # not found as nix package
        #cloudbrute
        #enumerepo
        #holehe
        #maigret
        #metabigor
        #p0f
        #sn0int
        #socialscan
        theharvester
        #urlhunter
        exiftool
        seclists
      ];
    };
  };
}