{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.proxies;
in
{
  options.home.components.proxies.enable = mkEnableOption "proxies";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #bettercap
        #burpsuite
        #ettercap
        #mitmproxy
        #mubeng
        #proxify
        #proxychains
        #redsocks
        #rshijack
        zap
      ];
    };
  };
}