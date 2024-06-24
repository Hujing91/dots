# Flake on fresh NixOS install
- Boot into ISO
- In terminal:
  - `git clone <repourl> /mnt/<path>`
  - `nixos-install --flake .#<host>`
  - `sudo reboot`
  - /* login */
  - `sudo rm -r /etc/nixos/configuration.nix`
  - /* move build to desired location */


# Rebuild after change:
`doas nixos-rebuild switch --flake .#<host>` \
Example: `doas nixos-rebuild switch --flake .#desktop`

In case of errors of dubious ownerships, have a dirty worktree and the command works.

# Known issues
## General
- [ ] Sway config workspace and power shortcuts do not work
- [ ] Keyring not working with wayland
- [ ] Missing icons in different consoles and applications like codium
- [ ] Local VM Software (e.g. VM Workstation) not starting

## Hyprland
- [ ] nu not known in terminal, so config shortcuts not working

## Desktop Host
- [ ] NVIDIA Crashes lead to environment restart
- [ ] Mount second hard drive encrypted

# Missing Features
- [ ] Replace hard drive uuid with labels
