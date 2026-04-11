{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 22;
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  imports = [
    ../home-config.nix
    ../../wallpapers/nixos.nix
    ../../packages/desktop/i3/i3.nix
    ../../packages/shells/bash/vm.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/desktop/mako/mako.nix
    ../../packages/terminal/tmux/tmux.nix
    ../../packages/terminal/emulators/alacritty/alacritty-vm.nix
    ../../packages/terminal/oh-my-posh/omp.nix
  ];
}
