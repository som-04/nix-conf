# In home.nix
{ config, pkgs, ... }:

{
  home.username = "som";
  home.homeDirectory = "/home/som";
  home.stateVersion = "25.05";

  imports = [
    ../pkgs/zed/package.nix
    ../pkgs/firefox/package.nix
    ../pkgs/git/package.nix
  ];

  home.packages = with pkgs; [
    libva
    libva-utils
    mesa
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";
    MOZ_ACCELERATED = "1";
  };

  programs.home-manager.enable = true;
}
