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
  
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      inter
      powerline-fonts
      nerdfonts
    ];
  };

  networking.hostName = "nixos-desktop";
  
  nixpkgs = {
    hostPlatform = "x86_64-linux";

    config = {
      # FIX: remove this once packages are updated: https://github.com/standardnotes/forum/issues/3626
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };

  programs = {
    seahorse.enable = true;
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
      #xdg.enable = true;
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };

    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      #NVIDIA SETTINGS
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = ["nvidia-dkms"];
    };
  };
}
