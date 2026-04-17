{ config, pkgs, ... }:

{
  # === DISPLAY & DESKTOP ===
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "plasmax11";
  services.desktopManager.plasma6.enable = true;

  # === WAYLAND ENVIRONMENT VARIABLES ===
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_SYNC_TO_VBLANK = "0";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # === AUDIO (Required for KDE) ===
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  # === BLUETOOTH (Optional but common) ===
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # === PRINTING (Commonly needed) ===
  services.printing.enable = true;

  # === KDE-SPECIFIC PACKAGES ===
  environment.systemPackages = with pkgs; [
    # Core KDE apps

    kdePackages.dolphin   # File manager

    # Useful extras
    kdePackages.gwenview  # Image viewer
    kdePackages.okular    # PDF viewer
    kdePackages.spectacle # Screenshot tool

    # System integration
    dconf                 # Required for settings
    libsForQt5.qt5ct      # Qt5 configuration (optional)
  ];

  # === OPTIONAL: Remove apps you don't want ===
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa        # Music player (remove if you don't use)
    # konsole    # Keep these if you want them
    # dolphin
  ];

  # === SDDM THEMING (Optional) ===
  services.displayManager.sddm = {
    theme = "breeze";
    autoNumlock = true;
    # wayland.enable = true;  # Uncomment if you want SDDM on Wayland
  };

  # === KDE CONFIGURATION (via home-manager, optional) ===
  # Add this to home.nix if you want declarative KDE settings:
  # imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  # programs.plasma.enable = true;
}
