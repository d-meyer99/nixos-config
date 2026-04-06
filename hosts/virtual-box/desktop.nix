{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    xkb.variant = "";
  };

  programs.sway.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  security.polkit.enable = true;
}
