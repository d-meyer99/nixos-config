{ ... }:
{
  services.xserver.windowManager.i3 = {
    enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables.XSESSION = "i3";
  services.xserver.enable = true;

  security.polkit.enable = true;
}
