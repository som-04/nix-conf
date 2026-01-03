{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nvidia.nix
      ../../de/cosmic.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "som";
  hardware.bluetooth.enable = true;

  programs.ssh.askPassword = pkgs.lib.mkForce "";

  programs.zsh.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kuwait";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];

  services.xserver.xkb.layout = "us";

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.variables = {
    XCOMPOSEFILE = "${pkgs.xorg.libX11}/share/X11/locale/en_US.UTF-8/Compose";
  };

  services.dbus.packages = with pkgs; [ dconf ];
  programs.seahorse.enable = true;

  users.users.som = {
    isNormalUser = true;
    description = "som";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ kdePackages.kate ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.som.imports = [ ../../home/home.nix ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    config.credential.helper = "store";
  };

  environment.systemPackages = with pkgs; [
    vim
    kitty
    git
    gh
    nodejs_24
    vlc
    ani-cli
    spotify
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}
