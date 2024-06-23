# Flake on fresh NixOS install
- Boot into ISO
- In terminal:
  - $ sudo su
  - nix-env .iA nixos.git
  - git clone $(repo url) /mnt/$(path)
  - nixos-install --flake .#<host>
  - reboot
  - /* login */
  - $ sudo rm -r /etc/nixos/configuration.nix
  - /* move build to desired location */


# Rebuild after change:
Example: $ sudo nixos-rebuild switch --flake .#desktop

# Known issues
## Generel
- [ ] Permission denied for child process e.g. in \
nu ~/.config/rofi/launch.nu workspace
- [ ] Failed to open connection to "session" message bus e.g. in \
sudo nu ~/.config/rofi/launch.nu workspace \
Authorization required, but no authorization protocol specified
- [ ] Keyring not working with wayland
- [ ] Missing icons in different consoles and applications like codium
- [ ] Local VM Software (e.g. VM Workstation) not starting
- [ ] XDG crashes home manager when enabling userDir

## Hyprland
- [ ] nu not known in terminal, so config shortcuts not working

## Desktop Host
- [ ] NVIDIA Crashes lead to environment restart
- [ ] Mount second hard drive encrypted

# Missing Features
- [ ] Replace hard drive uuid with labels
