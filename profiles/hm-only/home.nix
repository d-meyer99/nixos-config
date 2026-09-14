{pkgs, ...}: {

  home.packages = with pkgs; [
    keychain
  ];

  targets.genericLinux.enable = true;

  programs.neovim.enable = true;

  imports = [
    ../home-config.nix
    ../../packages/shells/bash/thinkpad.nix
    # ../../packages/git/git.nix
    # ../../packages/terminal/emulators/alacritty/alacritty.nix
    # ../../packages/terminal/tmux/tmux.nix
    # ../../packages/terminal/oh-my-posh/omp.nix
    # ../../packages/other/yt-dlp.nix
  ];
}
