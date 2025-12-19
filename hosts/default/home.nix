{ config, pkgs, ... }:

{

  home.username = "som";
  home.homeDirectory = "/home/som";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
      ./zed.nix
      ./zsh.nix
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
