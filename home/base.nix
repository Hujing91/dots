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

    enableNixpkgsReleaseCheck = false; # !Check whats going on with the hom manager version!

    packages = with pkgs; [
        # Terminal
        #btop		            # Ressource Manager
        #pfetch		          # Minimal fetch
        #ranger		          # File Manager
        htop
        
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