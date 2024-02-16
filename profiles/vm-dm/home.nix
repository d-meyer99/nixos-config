{
  imports = [
    ../homeConfig.nix
    ../../wallpapers/nixos.nix
    ../../packages/zsh/vm.nix
    ../../packages/git/git.nix
    ../../packages/keychain/keychain.nix
    ../../packages/alacritty/alacritty-vm.nix
    ../../packages/waybar/waybar-sway.nix
    ../../packages/sway/sway.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
