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
- [ ] XDG crashes home-manager 24.05

## Desktop Host
- [ ] NVIDIA Crashes lead to environment restart
- [ ] Add 2nd harddrive luks2 encrypted

# Missing Features
- [ ] Support VM Software (In Progress: Added Feature, Testing Remaining)
- [ ] Replace hard drive uuid with labels
- [ ] Use disko for automated partition setup on installation 