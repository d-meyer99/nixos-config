{pkgs, ...}: let
  packages = with pkgs; [
    neofetch
    neovim
    git
    wget
    (
      waybar.overrideAttrs
      (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      })
    )
    mako
    libnotify
    alacritty
    rofi-wayland
    xclip
    brave
    gcc
    zip
    unzip
    nodejs
    networkmanagerapplet
    ripgrep
    fd
    dolphin
    home-manager

    # Formatters
    stylua
    beautysh
    alejandra

    # Language servers
    nodePackages.bash-language-server
    lua-language-server
    nil
    nodePackages.vscode-css-languageserver-bin
  ];
in
  packages
