{ config, lib, pkgs, inputs, user, ... }:
{
  imports = [
    ../modules
  ];

  boot = {
    readOnlyNixStore = false;
    tmp.cleanOnBoot = true;
  };

  environment = {
    defaultPackages = [ ];

    systemPackages = with pkgs; [
      acpi
      git             # Repositories
      mkpasswd
      smartmontools

      killall         # Stop Applications
      usbutils        # USB utility info
      pciutils        # Computer utility info

      #grim            # screenshot functionality
      #slurp           # screenshot functionality
      #wl-clipboard    # wl-copy and wl-paste for copy/paste from stdin / stdout
    ];
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "de_DE.UTF-8";

    inputMethod = {
      enabled = "ibus";
    };

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ]; # 2022 openssh
      #allowedUDPPorts = [ 53 ];
      allowPing = false;
    };
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant. # conflict with networkmanager
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d --max-freed $((64 * 1024**3))";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };

    settings = {
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      sandbox = true;
      trusted-users = [ "@wheel" ];
    };
    
  };
  
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    dconf.enable = true;
    virt-manager.enable = true;
  };

  security = {
    rtkit.enable = true;

    doas.enable = true;
    sudo.enable = false;
  };

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    # don’t shutdown when power button is short-pressed
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';

    printing.enable = true;
  };

  system = {
    stateVersion = "24.05";

    #autoUpgrade = {
    #  enable = true;
    #  allowReboot = true;
    #  flake = "github:hujing91/dots";
    #  flags = [
    #    "--recreate-lock-file"
    #    "--no-write-lock-file"
    #    "-L"
    #  ];
    #  dates = "03:45";
    #};
  };

  time.timeZone = "Europe/Berlin";

  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [(pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd];
        };
      };
    };
    docker = {
      enable = true;
      autoPrune.enable = true;
      enableOnBoot = true;
    };
  };
}