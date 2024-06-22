{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.web;
in
{
  options.home.components.web.enable = mkEnableOption "web";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #apachetomcatscanner
        #arjun
        #brakeman
        #cameradar
        #cansina
        #cariddi
        #chopchop
        #clairvoyance
        #commix
        #crackql
        #crlfsuite
        #dalfox
        #dismap
        #dirstalk
        #dontgo403
        #forbidden
        #galer
        #gau
        gospider
        #gotestwaf
        #gowitness
        #graphqlmaker
        #graphqlmap
        #graphw00f
        #hakrawler
        #python3packages.hakuin
        #hey
        #httpx
        #nodePackages.hyperpotamus
        #jaeles
        #jsubfinder
        #jwt-hack
        #katana
        #kiterunner
        #mantra
        #mitmproxy2swagger
        #monsoon
        #nikto
        #nomore403
        #ntlmrecon
        #offat
        #photon
        #plecost
        #scraper
        #slowlorust
        #snallygaster
        #subjs
        #swaggerhole
        #uddup
        #wad
        webanalyze
        #websecprobe
        #whatweb
        #wprecon
        #wpscan
        #wsrepl
        #wuzz
        #xcrawl3r
        #xnlinkfinder
        #xsubfind3r
      ];
    };
  };
}