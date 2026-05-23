{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
    extraPackages32 = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = false;
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    nvidiaSettings = true;


    forceFullCompositionPipeline = false;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  environment.sessionVariables = {

    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_SYNC_TO_VBLANK = "0";
    KWIN_DRM_NO_AMS = "1";
    KWIN_TRIPLE_BUFFER = "1";
  };
  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
    "nvidia.NVreg_EnableMSI=1"
    "nvidia.NVreg_UsePageAttributeTable=1"
  ];

  boot.blacklistedKernelModules = [ "nouveau" ];
}
