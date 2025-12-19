{ config, lib, pkgs, ... }:

{
  programs.zed = {
    enable = true;
    extensions = [ "nix" "toml" "elixir" "make" "git firefly" ];
    settings = {
      theme = "One Dark";
      buffer_font_size = 14;
      buffer_font_family = "JetBrains Mono";
      ui_font_size = 13;
    };
  };
}
