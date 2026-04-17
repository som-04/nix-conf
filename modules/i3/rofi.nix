{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
  ];

  home-manager.users.som = {
    programs.rofi = {
      enable = true;
      theme = "nord";
      extraConfig = {
        modi = "drun,run,window";
        show-icons = true;
        terminal = "kitty";
      };
    };

    xdg.configFile."rofi/config.rasi".text = ''
      @theme "nord"
      configuration {
        modi: "drun,run,window";
        show-icons: true;
      }
    '';
  };
}
