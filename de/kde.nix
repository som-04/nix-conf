{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  #services.xserver.videoDrivers = [ "nvidia" ];
  #hardware.nvidia.modesetting.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    #GBM_BACKEND = "nvidia-drm";
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #WLR_NO_HARDWARE_CURSORS = "1";
    __GL_SYNC_TO_VBLANK = "0";
    MOZ_ENABLE_WAYLAND = "1";
  };


  #hardware.graphics.enable = true;
}
