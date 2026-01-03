{ config, lib, pkgs, ... }:

{
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-term
    cosmic-edit
  ];


  environment.systemPackages = with pkgs; [
    copyq
  ];

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 0;
}
