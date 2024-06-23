{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.services;
in
{
  options.home.components.services.enable = mkEnableOption "services";

  config = mkIf cnfg.enable {
    home = {
      packages = with pkgs; [
        #acltoolkit
        #checkip
        #ghunt
        #ike-scan
        #keepwn
        metasploit # metasploit-framework
        #nbutools
        #nuclei
        #openrisk
        #osv-scanner
        #uncover
        #traitor

        # E-Mail
        #mx-takeover
        #ruler
        #swaks
        #trustymail

        # Databases
        #ghauri
        #laudanum
        #mongoaudit
        nosqli
        #pysqlrecon
        sqlmap

        # SNMP
        #braa
        #onesixtyone
        #snmpcheck

        # SSH
        #baboossh
        #sshchecker
        #ssh-audit
        #ssh-mitm

        # IDS/IPS/WAF
        #teler
        #waf-tester
        #wafw00f

        # CI
        #oshka

        # Terraform
        #terrascan
        #tfsec

        # Supply chain
        #chain-bench
        #witness
        
        # WebDAV
        #davtest
      ];
    };
  };
}