{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Afterglow";
      font-size = 12;
    };
  };
}
