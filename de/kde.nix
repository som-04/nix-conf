{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";


  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_SYNC_TO_VBLANK = "0";
    MOZ_ENABLE_WAYLAND = "1";
  };

}
