{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.fuzzers;
in
{
  options.home.components.fuzzers.enable = mkEnableOption "fuzzers";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #afl
        #aflplusplus
        #feroxbuster
        ffuf
        gobuster
        #honggfuzz
        #radamsa
        #regexploit
        #scout
        #ssdeep
        #wfuzz
        #zzuf
      ];
    };
  };
}