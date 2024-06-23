{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/67b2c16d-41f4-4316-b70a-ff3f5a3e3629"; # "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-c7021aef-6bfb-4adb-8a23-2281a3fe0cdf".device = "/dev/disk/by-uuid/c7021aef-6bfb-4adb-8a23-2281a3fe0cdf";
  boot.initrd.luks.devices."luks-5b91795c-ce0f-471c-bf41-d9fe09041709".device = "/dev/disk/by-uuid/5b91795c-ce0f-471c-bf41-d9fe09041709";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8B8F-062A";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/791aef91-d5e0-4889-a47b-ea6a5948b682"; }
    ];
  
  hardware = {
    pulseaudio.enable = false;

    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = lib.mkDefault true;
    };

    # On issues check: https://nixos.wiki/wiki/Nvidia#CUDA
    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      powerManagement = {
        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
        # of just the bare essentials.
        enable = true;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        finegrained = true;
      };

   
      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
