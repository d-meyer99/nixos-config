{pkgs, ...}:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "foot";
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
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/desktop/waybar/waybar-sway.nix
    ../../packages/desktop/sway/sway.nix
    ../../packages/desktop/mako/mako.nix
    ../../packages/terminal/tmux/tmux.nix
    ../../packages/terminal/emulators/foot/foot.nix
    ../../packages/terminal/oh-my-posh/omp.nix
  ];
}
