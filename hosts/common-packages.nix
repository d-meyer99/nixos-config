{pkgs, ...}:
with pkgs; [
  neofetch
  neovim
  git
  wget
  (
    waybar.overrideAttrs (oldAttrs: {
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
  jq
  rustup
  cargo
  httpie
  vscode-extensions.vadimcn.vscode-lldb
  openssl
  pkg-config

  # Formatters
  stylua
  beautysh
  alejandra
  rustfmt

  # Language servers
  nodePackages.bash-language-server
  lua-language-server
  nil
  nodePackages.vscode-css-languageserver-bin
  rust-analyzer
]
