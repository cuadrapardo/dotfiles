# see https://wiki.nixos.org/wiki/GNOME
{ pkgs, config, ... }:

let
  # List of GNOME extensions installed
  gnomeExtensions = with pkgs.gnomeExtensions; [
    user-theme
    just-perfection
    caffeine
  ];

  # System packages for themes, icons, fonts
  gnomePackages = with pkgs; [
    # gtk themes
    gruvbox-dark-gtk
    gruvbox-gtk-theme
    gruvbox-material-gtk-theme
    # shell themes
    # icon themes
    gruvbox-dark-icons-gtk
    gruvbox-plus-icons
    # cursor themes
    capitaine-cursors-themed
    # fonts
    #fira-code
  ];

in {

  # GNOME extensions
  programs.gnome.gnomeExtensions = gnomeExtensions;
  
  environment.systemPackages = gnomePackages;

  fonts.fonts = fira_code;

  # Default GTK, icon, cursor theme, fonts, keybindings
}


