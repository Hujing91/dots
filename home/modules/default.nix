{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
    ./gtk
    ./nushell
    ./screenshot
    ./sway
    ./xdg
  ];
}