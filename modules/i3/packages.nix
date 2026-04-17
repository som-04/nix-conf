{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    i3status
    i3lock
    i3blocks
    feh
    picom
    flameshot
    brightnessctl
    playerctl
    libnotify
    dunst
    blueman
    bluez
    bluez-tools
    volumeicon
  ];
}
