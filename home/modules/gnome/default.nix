{ config, lib, pkgs, home-manager, ... }:
with lib;

let
  cnfg = config.home.modules.gnome;
in
{
  options.home.modules.gnome = {
    enable = mkEnableOption "gnome";

    
  };

  config = mkIf cnfg.enable {
      home = {
        services = {
            # Enable the gnome-keyring secrets vault. 
            # Will be exposed through DBus to programs willing to store secrets.
            gnome.gnome-keyring.enable = true;

            xserver = {
                # Enable the X11 windowing system.
                enable = true;

                # Enable the GNOME Desktop Environment.
                displayManager.gdm.enable = true;
                desktopManager.gnome.enable = true;
            };
        };
      };
    };
}