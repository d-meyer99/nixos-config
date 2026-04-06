{ pkgs, lib, ... }:
{
  fonts = {
    packages =
      with pkgs;
      [
        vista-fonts
        dejavu_fonts
        liberation_ttf
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues nerd-fonts);
  };
}
