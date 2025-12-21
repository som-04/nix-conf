{ config, lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" "elixir" "make" "git firefly" ];
    userSettings = {
      theme = "Ayu Dark";
      buffer_font_size = 14;
      buffer_font_family = ".ZedMono";
      ui_font_size = 16;
      inlay_hints = {
        enabled = false;
      };
      base_keymap = "VSCode";
      prettier = {
        allowed = true;
      };
    };
  };
}
