{ config, lib, ... }:

with lib;
let cnfg = config.home.modules.browser;

in {
  options.home.modules.browser.enable = mkEnableOption "browser";

  config = mkIf cnfg.enable {
    home.components.firefox = {
      enable = true;
      enableDunstIntegration = true;
      enableXdgAssociations = true;
      setDefaultBrowserSessionVariable = true;
    };
  };
}