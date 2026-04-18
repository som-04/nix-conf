{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "plasmax11";
  services.desktopManager.plasma6.enable = true;


  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_SYNC_TO_VBLANK = "0";
    MOZ_ENABLE_WAYLAND = "1";
  };


  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.printing.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.spectacle
    dconf
    libsForQt5.qt5ct
  ];


  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    konsole
  ];

  services.displayManager.sddm = {
    theme = "breeze";
    autoNumlock = true;
    # wayland.enable = true;
  };
}
