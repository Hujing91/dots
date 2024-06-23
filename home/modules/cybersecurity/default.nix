{ config, lib, ... }:

with lib;
let cnfg = config.home.modules.cybersecurity;

in {
  options.home.modules.cybersecurity.enable = mkEnableOption "cybersecurity";

  config = mkIf cnfg.enable {
    home.components = {
      fuzzers.enable = true;
      malware.enable = true;
      network.enable = true;
      osint.enable = true;
      password.enable = true;
      portscanners.enable = true;
      proxies.enable = true;
      services.enable = true;
      tls.enable = true;
      traffic.enable = true;
      web.enable = true;
    };
  };
}




      