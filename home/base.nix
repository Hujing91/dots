{ pkgs, user, ... }:
{
  imports = [
    ./components
    ./modules
  ];

  home = {
    stateVersion = "24.05";

    modules = {
      console.enable = true;
    };

    packages = with pkgs; [
        # Terminal
        #pfetch		          # Minimal fetch
        #ranger		          # File Manager
        htop
        wget                # Downloader

        # Video/Audio
        #feh		            # Image Viewer
        #mpv		            # Media Player
        #obs-studio		      # Broadcasting
        #pavucontrol	      # Audio control
        #plex-media-player	# Media Player
        #vlc		            # Media Player
        #stremio		        # Media Streamer
        
        # Apps
        #pcmanfm		        # File Manager
        #remmina		        # XRDP Client
        
        # File Management
        unzip		            # Zip files
        unrar		            # Rar files
        
        # General configuration
        vscodium		        # IDE
        #neovim		          # Text Editor
        zsh		              # Shell
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}