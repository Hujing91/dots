{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.services.modules.xdg;
in
{
  options.services.modules.xdg.enable = mkEnableOption "xdg";

  config = mkIf cnfg.enable {
    xdg = {
      portal = {
        enable = true;
        configPackages = with pkgs; [
          xdg-desktop-portal-hyprland
        ];
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
        ];
        config.common.default = "*";
        wlr.enable = true;
      };
    };
  };
}