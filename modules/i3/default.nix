{ config, pkgs, ... }:

{
  imports = [
    ./config.nix
    ./status.nix
    ./packages.nix
    ./touchpad.nix
    ./rofi.nix
    ./display-manager.nix

  ];
}
