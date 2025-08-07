# home.nix

{ config, pkgs, ... }:

{
  home.username = "som";
  home.homeDirectory = "/home/som";

  # It's good practice to align this with your system's state version.
  # Your configuration.nix has "25.05".
  home.stateVersion = "25.05";

  home.packages = [
    # pkgs.zsh-completions
    # pkgs.zsh-powerlevel10k
    # pkgs.zsh-syntax-highlighting
    # pkgs.zsh-history-substring-search
  ];
}
#   programs.zsh = {
#     enable = true;
#     shellAliases = {
#       ll = "ls -l";
#     };
#     autosuggestion.enable = true;

#     # Correct configuration for oh-my-zsh
#     ohMyZsh = {
#       enable = true;
#       plugins = [
#         "git"
#         "history-substring-search" # Note: The plugin name is 'history-substring-search'
#         "zsh-autosuggestions"
#       ];
#     };
#   };
# }
