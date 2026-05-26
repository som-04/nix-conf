{ pkgs, ... }:
{

  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "somya";
        email = "somyasati14@gmail.com";
      };
      credential.helper = "store";
    };
  };
}
