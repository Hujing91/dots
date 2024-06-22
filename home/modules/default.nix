{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
    ./gtk
    ./hypr
    ./notification
    ./nushell
    ./screenshot
    ./sidebar
    ./statusbar
    ./sway
    ./xdg
  ];
}