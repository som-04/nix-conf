{ config, pkgs, ... }:
{

  # This creates the `nvidia-offload` command to run any app on the dGPU.
  environment.systemPackages =
    let
      nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
        export __NV_PRIME_RENDER_OFFLOAD=1
        export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export __VK_LAYER_NV_optimus=NVIDIA_only
        exec "$@"
      '';
    in
    [ nvidia-offload ];

  # Hardware configuration for NVIDIA PRIME offload.
  hardware = {
    opengl = {
          enable = true;
          driSupport32Bit = true;
        };
    nvidia = {
      modesetting.enable = true;

      open = false;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        # offload.enable = true;
        # sync.enable = true;
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    graphics.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
