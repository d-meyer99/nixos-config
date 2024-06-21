{
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  imports = [
    ../home-config.nix
    ../../wallpapers/skyline.nix
    ../../packages/desktop/hyprland/hyprland.nix
    ../../packages/shells/bash/thinkpad.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/terminal/emulators/alacritty/alacritty.nix
    ../../packages/desktop/waybar/waybar-hyprland.nix
    ../../packages/desktop/mako/mako.nix
    ../../packages/terminal/tmux/tmux.nix
  ];
}
