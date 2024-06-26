{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.users.hujing;
in
{
  options.users.hujing = {
    enable = mkEnableOption "hujing user";

    dockerGroupMember = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, the user gets added to the docker group.
      '';
    };
  };

  config =
    let
      extraGroups = [
        "audio"
        "disk"
        "networkmanager"
        "video"
        "wheel"
        "libvirtd"
      ];
    in
    mkIf cnfg.enable
      {
        users = {
          users.hujing = {
              extraGroups =
                if cnfg.dockerGroupMember
                then extraGroups ++ [ "docker" ]
                else extraGroups;
              group = "users";
              home = "/home/hujing";
              isNormalUser = true;
              description = "hujing";
              shell = pkgs.nushell;
              uid = 1000;
          };
        };

        security.doas = {
          extraRules = [{
            users = [ "hujing" ];
            keepEnv = true;
            persist = true;
          }];
        };
      };
}