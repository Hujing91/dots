{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.modules.xdg;
in
{
  options.home.modules.xdg.enable = mkEnableOption "xdg";

  config =
    mkIf cnfg.enable {
      home = {
        packages = with pkgs; [
          xdg-utils
        ];
      };
      
      xdg = { 
        enable = true;
        userDirs = 
          let appendToHomeDir = path: "${config.home.homeDirectory}/${path}"; 
          in 
          { 
            enable = true; 
            desktop = appendToHomeDir "desktop";
            documents = appendToHomeDir "documents";
            download = appendToHomeDir "downloads";
            music = appendToHomeDir "music";
            pictures = appendToHomeDir "pictures";
            publicShare = appendToHomeDir "public";
            templates = appendToHomeDir "templates";
            videos = appendToHomeDir "videos";
          };
      };
    };
}