{pkgs, ...}:
with pkgs; [
  fastfetch
  neovim
  brave
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
  sqlite-interactive
  tree-sitter
  typst

  # Formatters
  stylua
  beautysh
  alejandra
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
  typescript
  sqls
  gopls
  docker-ls
  emmet-ls
  tinymist

  # build inputs
  librsvg
  webkitgtk_4_1

  # frontend test
  firefox
  geckodriver
  wasm-pack
]
