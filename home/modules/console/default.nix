{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.modules.console;
in
{
  options.home.modules.console.enable = mkEnableOption "console";

  config = mkIf cnfg.enable {
    home = {
      components = {
        #fzf.enable = true;
        #git.enable = true;
        #ssh.enable = true;
        zellij.enable = true;
      };

      modules = {
      #  neocode.enable = true;
        nushell.enable = true;
      };

      packages = with pkgs; [
        bat
        bottom
        curl
        # TODO: add component for lazygit
        lazygit
        ncurses
        tailspin
        yeet

        unixtools.watch
      ];
    };
  };
}