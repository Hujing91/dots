{ home-manager, ... }:
{
  imports = [
    ./browser
    ./clipboard
    ./console
    ./console
    ./cybersecurity
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