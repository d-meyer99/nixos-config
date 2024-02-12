{ config, pkgs, ... }:

{
  imports = [
    ../../wallpapers/wallpaper.nix
    ../../packages/hyprland/hyprland.nix
    ../../packages/zsh/thinkpad.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/alacritty/alacritty.nix
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
