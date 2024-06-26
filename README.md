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

# Virt-Manager Configuration
File (in the menu bar) -> Add connection

HyperVisor = QEMU/KVM
Autoconnect = checkmark

Connect

# Known issues
## General
- [ ] Keyring not working with wayland
- [ ] Missing icons in different consoles and applications like codium

## Desktop Host
- [ ] NVIDIA Crashes lead to environment restart
- [ ] Mount second hard drive encrypted

# Missing Features
- [ ] Support VM Software
- [ ] Replace hard drive uuid with labels
