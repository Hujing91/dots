{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
    ./gnome
    ./gtk
    ./notification
    ./nushell
    ./screenshot
    ./sidebar
    ./statusbar
    ./sway
    ./xdg
  ];
}