{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
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