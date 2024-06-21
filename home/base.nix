{ user, ... }:
{
  imports = [
    ./components
    ./modules
  ];

  home = {
    modules = {
      console.enable = true;
    };

    username = "${user}";
    homeDirectory = "/home/${user}";
    enableNixpkgsReleaseCheck = false; # !Check whats going on with the hom manager version!

    packages = with pkgs; [
        # Terminal
        #btop		# Ressource Manager
        #pfetch		# Minimal fetch
        #ranger		# File Manager
        htop
        
        # Video/Audio
        #feh		# Image Viewer
        #mpv		# Media Player
        #obs-studio		# Broadcasting
        #pavucontrol	# Audio control
        #plex-media-player	# Media Player
        #vlc		# Media Player
        #stremio		# Media Streamer
        
        # Apps
        #pcmanfm		# File Manager
        #remmina		# XRDP Client
        
        # File Management
        #unzip		# Zip files
        #unrar		# Rar files
        
        # General configuration
        git			# Repositories
        vscodium		# IDE
        #killall		# Stop Applications
        #neovim		# Text Editor
        #pciutils		# Computer utility info
        #usbutils		# USB utility info
        #pulsaudio		# Sound
        #wget		# Downloader
        #zsh		# Shell
        
        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        # # You can also create simple shell scripts directly inside your
        # # configuration. For example, this adds a command 'my-hello' to your
        # # environment:
        # (pkgs.writeShellScriptBin "my-hello" ''
        #   echo "Hello, ${config.home.username}!"
        # '')
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}