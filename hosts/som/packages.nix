{pkgs, ...}:{

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
}
