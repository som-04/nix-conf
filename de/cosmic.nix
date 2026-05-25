{ config, pkgs, ... }:

{
  # Enable X11 (COSMIC needs this)
  services.xserver.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  # Keyboard layout for COSMIC sessions
  services.xserver.xkb.layout = "us";

  # COSMIC desktop packages
  environment.systemPackages = with pkgs; [
    cosmic-session
    cosmic-files
    libglvnd
    mesa
  ];
  environment.cosmic.excludePackages = with pkgs; [
      cosmic-edit
      cosmic-term
    ];
  services.xserver.desktopManager.session = [{
      name = "cosmic";
      start = ''
        # Start COSMIC compositor and session
        exec ${pkgs.cosmic-session}/bin/cosmic-session
      '';
    }];

  programs.appimage = {
      enable = true;
      binfmt = true;
    };
  # Enable COSMIC extensions
  # services.cosmic = {
  #   enable = true;
  #   extensions.enable = true;
  # };
  environment.sessionVariables = {
    COSMIC_DATA_CONTROL_ENABLED = "1";
  };
  environment.variables = {
    LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";
  };
}
