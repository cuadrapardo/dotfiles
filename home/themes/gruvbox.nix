{ config, pkgs, stylix, ... }:

{
  stylix = {
    enable = true;

    # Stylix base theme
    base16Theme = "gruvbox-dark-medium";
    iconTheme = "Papirus";
    cursorTheme = "Bibata-Modern-Ice";

    fonts = {
      monospace = "JetBrainsMono Nerd Font";
      sansSerif = "Inter";
    };

    # Override wallpaper
    image = ./wallpapers/gruvbox.jpg;
  };
}

