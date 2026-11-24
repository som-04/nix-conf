{ pkgs, ... }:

{
  programs.opencode = {
    enable = true;
    settings = {
      model = "deepseek/deepseek-v4-flash";
    };
  };
}
