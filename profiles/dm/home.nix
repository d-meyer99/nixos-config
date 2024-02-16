{
  imports = [
    ../homeConfig.nix
    ../../wallpapers/skyline.nix
    ../../packages/hyprland/hyprland.nix
    ../../packages/zsh/thinkpad.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/alacritty/alacritty.nix
    ../../packages/waybar/waybar-hyprland.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
