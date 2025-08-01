{lib, ...}: let
  colors = import ../../../../utils/colors.nix;
in {
  imports = [
    ./alacritty.nix
  ];

  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.70;
    font.size = lib.mkForce 12;
    colors = lib.mkForce (colors.getAlacrittyColors colors.schemes.blue_toned);
  };
}
