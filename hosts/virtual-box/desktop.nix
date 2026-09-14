{ ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    windowManager.i3.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables.XSESSION = "i3";

  security.polkit.enable = true;
}
