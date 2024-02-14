{lib, ...}:
{
  imports = [
    ./alacritty.nix
  ];

  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.78;
    font.size = lib.mkForce 12;
  };
}
