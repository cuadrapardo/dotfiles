# System wide packages
{ pkgs }:

with pkgs;

  [
    vim-full
    # communication
    discord
    # utils
    tree
    git
    lshw
    htop
    pciutils
    fastfetch
    #modifications/theming
    caffeine-ng #no sleep option in status bar
    gnome-tweaks
  ]

