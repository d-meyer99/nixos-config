{ config, pkgs, ... }:

let
  myAliases = {
    v = "nvim";
    vnix-conf = "nvim ~/.dotfiles/hosts/default/configuration.nix";
    vnix-home = "nvim ~/.dotfiles/hosts/default/home.nix";
    nixos-test = "sudo nixos-rebuild test --flake /home/dm/.dotfiles#default";
    nixos-switch =
      "sudo nixos-rebuild switch --flake /home/dm/.dotfiles#default";
    hm-switch = "home-manager switch --flake /home/dm/.dotfiles#dm";
    ll = "ls -la";
  };

  ohMyPoshThemePath = ".config/oh-my-posh/theme.omp.json";
in
{
  home.username = "dm";
  home.homeDirectory = "/home/dm";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.oh-my-posh
    pkgs.keychain
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  programs.alacritty.enable = true;

  programs.git = {
    enable = true;
    userName = "d-meyer99";
    userEmail = "d.meyer99@hotmail.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initExtra = ''
      eval "$(oh-my-posh init zsh --config /home/dm/${ohMyPoshThemePath})"
    '';
    loginExtra = ''
      dbus-run-session Hyprland
    '';
  };

  home.file.${ohMyPoshThemePath}.source =
    ../../packages/oh-my-posh/theme.omp.json;

  programs.keychain = {
    enable = true;
    enableZshIntegration = true;
    keys = [
      "id_ed25519"
    ];
  };

  # home.file.".config/hypr/hyprland.conf".source = ../../packages/hyprland/hyprland.conf;

  # home.file.".config/hypr/start.sh".source = ../../packages/hyprland/start.sh;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
