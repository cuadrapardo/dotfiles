{ config, pkgs, ... }:

{
  home.username = "caroccp";
  home.homeDirectory = "/home/caroccp";

  # Example configuration:
  #programs.git.enable = true; This would allow me to modify that packages' user-level configuration

  #common things to add here:
  #shells, path tweaks, config templates, authentication & keys, fonts

  home.packages = with pkgs; [
    fzf
    zotero
    gnomeExtensions.just-perfection
    gnomeExtensions.cronomix
  ];

  # Home Manager needs this
  home.stateVersion = "25.05";
}

