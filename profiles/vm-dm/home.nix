{pkgs, ...}:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 22;
  };

  imports = [
    ../home-config.nix
    ../../wallpapers/nixos.nix
    ../../packages/shells/bash/vm.nix
    ../../packages/desktop/i3/i3.nix
    ../../packages/desktop/i3/i3blocks.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/terminal/tmux/tmux.nix
    ../../packages/terminal/emulators/alacritty/alacritty-vm.nix
    ../../packages/terminal/oh-my-posh/omp.nix
    ../../packages/desktop/i3/picom/picom.nix
  ];
}
