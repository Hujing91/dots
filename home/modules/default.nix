{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
    ./gtk
    ./nushell
    ./screenshot
    ./sidebar
    ./statusbar
    ./sway
    ./xdg
  ];
}