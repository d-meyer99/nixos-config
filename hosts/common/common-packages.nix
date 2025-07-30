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
  libnotify
  alacritty
  rofi-wayland
  wl-clipboard
  brave
  gcc
  zip
  unzip
  nodejs
  networkmanagerapplet
  ripgrep
  fd
  kdePackages.dolphin
  home-manager
  jq
  rustup
  cargo
  httpie
  vscode-extensions.vadimcn.vscode-lldb
  openssl.dev
  openssl
  pkg-config
  dbus
  widevine-cdm
  tmux
  yazi
  diesel-cli
  htop
  go
  jdk
  docker
  delve
  tree

  # Formatters
  stylua
  beautysh
  alejandra
  rustfmt
  nodePackages.prettier
  sqlfluff

  # Language servers
  nodePackages.bash-language-server
  lua-language-server
  nil
  nodePackages.vscode-langservers-extracted
  nodePackages.javascript-typescript-langserver
  nodePackages.typescript-language-server
  nodePackages.svelte-language-server
  rust-analyzer
  typescript
  sqls
  gopls
  docker-ls
]
