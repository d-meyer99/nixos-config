{ config, pkgs, ... }:

{
  imports = [
    ../../wallpapers/nixos.nix
    ../../packages/zsh/vm.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/alacritty/alacritty-vm.nix
    ../../packages/waybar/waybar-sway.nix
    ../../packages/sway/sway.nix
  ];
  home.username = "dm";
  home.homeDirectory = "/home/dm";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.oh-my-posh
    pkgs.keychain
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  programs.alacritty.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
