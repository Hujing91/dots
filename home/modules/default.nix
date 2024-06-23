{ home-manager, ... }:
{
  imports = [
    ./browser
    ./clipboard
    ./console
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