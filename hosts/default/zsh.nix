{ config, pkgs, ... }:

{
  # Enable Zsh configuration
  programs.zsh = {
    enable = true;

    # Set some useful aliases
    # gtfo keeps the 3 latest gens
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake .#";
      gc = "nix-collect-garbage -d";
      gens = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      gtfo = "sudo nix-env --delete-generations +3 --profile /nix/var/nix/profiles/system";
      add = "git add .";
      amend = "git commit --amend --no-edit";
      pushf = "git push -f";
    };

    # Enable Oh My Zsh
    oh-my-zsh = {
      enable = true;
      # Choose a theme
      theme = "robbyrussell";
      # Add plugins
      plugins = [
        "git"
        # "zsh-syntax-highlighting"
        # "zsh-autosuggestions"
      ];
    };
  };
}
