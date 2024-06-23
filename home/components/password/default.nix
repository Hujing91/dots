{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.password;
in
{
  options.home.components.password.enable = mkEnableOption "password";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #authoscope
        #bruteforce-luks
        #brutespray
        #conpass
        #crunch
        #h8mail
        hashcat
        hashcat-utils
        #hashdeep
        #john
        #legba
        #medusa
        #nasty
        #ncrack
        #nth
        #phrasendrescher
        #python3Packages.patator
        hydra
        #thc-hydra
        #truecrack
      ];
    };
  };
}