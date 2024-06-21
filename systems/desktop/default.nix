# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
  imports = [ 
    ../shared/base.nix
    ../shared/pentestBase.nix
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
    timeout = 2;
  };
  
  networking.hostName = "nixos-desktop";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  programs = {
    firefox.enable = true;
    steam.enable = true;
  };

  services = {
    # Enable the gnome-keyring secrets vault. 
    # Will be exposed through DBus to programs willing to store secrets.
    gnome.gnome-keyring.enable = true;

    modules = {
      gtk.enable = true;
      #tuigreet = {
      #  enable = true;
      #  command = "sway";
      #  # command = "Hyprland";
      #};
      xdg.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "de";
        variant = "";
      };

      #NVIDIA SETTINGS
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = ["nvidia-dkms"];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer

    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
      extraPkgs = pkgs: [
        winePackages.staging
        wine64Packages.staging
      ];
    })
  ];
}
