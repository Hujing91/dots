{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.firefox;
in
{
  options.home.components.firefox = {
    enable = mkEnableOption "firefox";

    enableDunstIntegration = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, firefox gets set as default browser in dunst.
      '';
    };

    enableXdgAssociations = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, firefox gets set as default browser in xdg.
      '';
    };

    setDefaultBrowserSessionVariable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, firefox gets set as default browser with DEFAULT_BROWSER.
      '';
    };
  };

  config = mkIf cnfg.enable {
    programs.firefox.enable = true;

    # INFO: set firefox as default browser for electron apps
    home.sessionVariables.DEFAULT_BROWSER = mkIf cnfg.setDefaultBrowserSessionVariable
      "${pkgs.firefox}/bin/firefox";

    xdg.mimeApps.associations.added = mkIf cnfg.enableXdgAssociations {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}