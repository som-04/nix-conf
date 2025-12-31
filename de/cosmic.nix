{ config, lib, pkgs, ... }:

let

  cosmicPackages = with pkgs; [
    cosmic-session
    cosmic-launcher
    cosmic-panel
    cosmic-term
    cosmic-files
    cosmic-settings
  ];


  sddmThemePackages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-plymouth
  ];
in {

  services.xserver = {
    enable = true;


    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "breeze";
    };


    desktopManager.plasma6.enable = lib.mkForce false;
    desktopManager.gnome.enable = false;
    desktopManager.xterm.enable = false;
  };


  environment.systemPackages = cosmicPackages ++ sddmThemePackages;


  services.xserver.displayManager.session = [{
    name = "cosmic";
    manage = "desktop";
    start = ''
      export XDG_CURRENT_DESKTOP=COSMIC
      export QT_QPA_PLATFORM=wayland
      exec ${pkgs.cosmic-session}/bin/cosmic-session
    '';
  }];


  services.xserver.displayManager.defaultSession = "cosmic";
}
