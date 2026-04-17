{ config, pkgs, ... }:

{
  # Enable X11 (COSMIC needs this)
  services.xserver.enable = true;

  # Display manager for COSMIC
  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "cosmic";
  };

  # Keyboard layout for COSMIC sessions
  services.xserver.xkb.layout = "us";

  # COSMIC desktop packages
  environment.systemPackages = with pkgs; [
    cosmic-greeter
    cosmic-session
    cosmic-edit
    cosmic-term
    cosmic-files
  ];

  # Enable COSMIC extensions
  services.cosmic = {
    enable = true;
    extensions.enable = true;
  };
}
