{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.tor;
in
{
  options.home.components.tor = {
    enable = mkEnableOption "tor";
  };

  config = mkIf cnfg.enable {
    # https://nixos.wiki/wiki/Tor
    services.tor = {
      settings = {
        UseBridges = true;
        ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
        Bridge = "obfs4 IP:ORPort [fingerprint]"
      };
      client = {
        enable = true;
      };
    };
  };
}