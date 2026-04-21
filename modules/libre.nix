{ config, pkgs, lib, ... }:

{
  options.libre = {
    enable = lib.mkEnableOption "LibreOffice suite with spell checking";
  };

  config = lib.mkIf config.libre.enable {
    environment.systemPackages = with pkgs; [
      libreoffice-qt
      hunspell
      hyphenDicts.en_GB
    ];
  };
}
