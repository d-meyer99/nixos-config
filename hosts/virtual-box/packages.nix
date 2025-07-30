{ pkgs, ... }:
let
  extraPackages = with pkgs; [
    gtk3
    foot
    mesa
  ];
  allPackages = import ../common/common-packages.nix { inherit pkgs; } ++ extraPackages;
in
{
  environment.systemPackages = allPackages;
}
