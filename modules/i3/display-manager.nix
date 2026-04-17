{ ... }:

{
  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "none+i3";
  };
}
