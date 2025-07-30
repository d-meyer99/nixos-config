{ ... }:
{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = true;
    xkb.layout = "pl";
    videoDrivers = [
      "virtualBox"
      "vmware"
    ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  security.polkit.enable = true;
}
