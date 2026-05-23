# In home.nix
{ config, pkgs, ... }:

{
  home.username = "som";
  home.homeDirectory = "/home/som";
  home.stateVersion = "25.05";

  imports = [
    ../modules/zed.nix
    ../modules/zsh.nix
    ../modules/firefox.nix
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
