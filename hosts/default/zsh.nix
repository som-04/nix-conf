{ config, pkgs, ... }:

{
  # Enable Zsh configuration
  programs.zsh = {
    enable = true;

    # Set some useful aliases
    # gtfo keeps the 3 latest gens
    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake .#";
      update = "nix flake update";
      gc = "nix-collect-garbage -d";
      gens = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      gtfo = "sudo nix-env --delete-generations +3 --profile /nix/var/nix/profiles/system";
      add = "git add .";
      amend = "git commit --amend --no-edit";
      pushf = "git push -f";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        # "zsh-syntax-highlighting"
        # "zsh-autosuggestions"
      ];
    };
  };
}
