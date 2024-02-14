{ config, pkgs, ... }:

{
  imports = [
    ../../wallpapers/wallpaper.nix
    ../../packages/zsh/vm.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/alacritty/alacritty-vm.nix
    ../../packages/waybar/waybar-sway.nix
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

  # wayland.windowManager.sway = {
  #   enable = true;
  #   xwayland = true;
  #   config = {
  #     gaps = {
  #       vertical = 5;
  #       left = 5;
  #       right = 5;
  #       bottom = 5;
  #     };
  #   };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
