{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.modules.cybersecurity;
in
{
  options.home.modules.cybersecurity.enable = mkEnableOption "cybersecurity";

  config = mkIf cnfg.enable {
    imports =
    [ 
      ./port-scanners.nix
    ];
  };
}