{ pkgs, lib, ... }:
{
  fonts.packages =
    with pkgs;
    [
      vistafonts
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues nerd-fonts);
}
