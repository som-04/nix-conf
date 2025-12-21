{ config, lib, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild = "cd ~/nix/nix-conf && sudo nixos-rebuild switch --flake .#som";
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
      theme = "half-life";
      plugins = [
        "git"
      ];
    };
  };
}
