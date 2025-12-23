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

  home.packages = [

  ];


  home.file = {

  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
