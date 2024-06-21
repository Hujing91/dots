# Flake on fresh NixOS install
- Boot into ISO
- In terminal:
  - $ sudo su
  - nix-env .iA nixos.git
  - git clone <repo url> /mnt/<path>
  - nixos-install --flake .#<host>
  - reboot
  - /* login */
  - $ sudo rm -r /etc/nixos/configuration.nix
  - /* move build to desired location */


# Rebuild after change:
Example: $ sudo nixos-rebuild switch --flake .#desktop
