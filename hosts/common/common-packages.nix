{pkgs, ...}:
with pkgs; [
  fastfetch
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
  rofi
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
  cargo-tauri
  trunk
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
  wrapGAppsHook4
  sqlite
  tree-sitter

  # Formatters
  stylua
  beautysh
  alejandra
  rustfmt
  prettier
  sqlfluff

  # Language servers
  bash-language-server
  lua-language-server
  nil
  vscode-langservers-extracted
  javascript-typescript-langserver
  typescript-language-server
  svelte-language-server
  rust-analyzer
  typescript
  sqls
  gopls
  docker-ls
  emmet-ls

  # build inputs
  librsvg
  webkitgtk_4_1
]
