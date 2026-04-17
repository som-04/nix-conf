{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nvidia.nix
     ../../de/kde.nix
    #../../modules/i3/default.nix
    ../../modules/steam.nix
    inputs.home-manager.nixosModules.default
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
    XCOMPOSEFILE = "${pkgs.xorg.libX11}/share/X11/locale/en_US.UTF-8/Compose";
  };

  # User
  users.users.som = {
    isNormalUser = true;
    description = "som";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ kdePackages.kate ];
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.som.imports = [ ../../home/home.nix ];
  };

  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Git
  programs.git = {
    enable = true;
    config.credential.helper = "store";
  };

  # System packages (shared across all desktops)
  environment.systemPackages = with pkgs; [
    vim
    kitty
    git
    gh
    nodejs_24
    vlc

    spotify
    discord-ptb
    protonvpn-gui
    ntfs3g
  ];

  system.stateVersion = "25.05";
}
