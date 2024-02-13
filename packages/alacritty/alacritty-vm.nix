{lib, ...}:
{
  imports = [
    ./alacritty.nix
  ];

  programs.alacritty.settings.font.size = lib.mkForce 12;
}
