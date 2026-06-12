{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../pkgs/nvidia/package.nix
    ../../de/cosmic.nix
    # ../../pkgs/steam/package.nix
    ../../pkgs/libre/package.nix
    ../../pkgs/zsh/package.nix
    ../../pkgs/virtualbox/package.nix
  ];

  # System basics
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "som";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  time.timeZone = "Asia/Kuwait";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];

  # Audio (system-wide)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 2048;
          "default.clock.min-quantum" = 2048;
          "default.clock.max-quantum" = 8192;
        };
    };
  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Printing
  services.printing.enable = true;

  # SSH
  programs.ssh.askPassword = pkgs.lib.mkForce "";

  # Shell
  programs.zsh.enable = true;

  # DBus
  services.dbus.packages = with pkgs; [ dconf ];
  programs.seahorse.enable = true;

  # Environment
  environment.variables = {
    XCOMPOSEFILE = "${pkgs.libx11}/share/X11/locale/en_US.UTF-8/Compose";
  };

  # User
  users.users.som = {
    isNormalUser = true;
    description = "som";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ kdePackages.kate ];
  };

  libre.enable = true;
  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.som.imports = [ ../../home/home.nix ];
  };

  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # System packages (shared across all desktops)
  environment.systemPackages = with pkgs; [
    vim
    kitty
    gh
    nodejs_24
    vlc
    spotify
    proton-vpn
    manga-tui
    ani-cli
    bottles
    opencode
    sbctl
  ];
  services.power-profiles-daemon.enable = true;
  # services.tlp = {
  #     enable = true;
  #     settings = {
  #       TLP_ENABLE = 1;
  #       STOP_CHARGE_THRESH_BAT0 = 0;

  #       # TLP_PROFILES_DAEMON = 1;


  #       # # For AC power (Performance profile)
  #       # CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #       # CPU_MIN_PERF_ON_AC = 0;
  #       # CPU_MAX_PERF_ON_AC = 100;

  #       # # For battery power (Balanced profile)
  #       # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #       # CPU_MIN_PERF_ON_BAT = 0;
  #       # CPU_MAX_PERF_ON_BAT = 50;
  #     };
  # };
  # system.stateVersion = "25.05";
}
