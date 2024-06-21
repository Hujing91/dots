{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.users.hujing;
in
{
  options.users.hujing = {
    enable = mkEnableOption "hujing user";
  };

  config = mkIf cnfg.enable
  {
    users = {
        users.hujing = {
            extraGroups = [
                "audio"
                "disk"
                "networkmanager"
                "video"
                "wheel"
            ];
            home = "/home/hujing";
            isNormalUser = true;
            description = "hujing";
        };
    };
  };
}