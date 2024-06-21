{ home-manager, ... }:
{
  imports = [
    ./clipboard
    ./console
    ./gtk
    ./screenshot
    ./sway
    ./xdg
  ];
}