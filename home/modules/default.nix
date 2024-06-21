{ home-manager, ... }:
{
  imports = [
    ./console
    ./gtk
    ./screenshot
    ./sway
    ./xdg
  ];
}