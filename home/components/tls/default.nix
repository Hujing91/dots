{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.tls;
in
{
  options.home.components.tls.enable = mkEnableOption "tls";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #cero
        #sslscan
        #ssldump
        #sslsplit
        #sslstrip
        testssl
        #tlsx
      ];
    };
  };
}