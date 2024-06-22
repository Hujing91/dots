{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
    ./gtk
    ./nushell
    ./screenshot
    ./statusbar
    ./sway
    ./xdg
  ];
}