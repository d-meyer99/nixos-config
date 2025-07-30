{ hostName, ... }:
{
  networking = {
    inherit hostName;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      # Open ports in the firewall.
      # alowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # enable = false;
    };
  };

  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICAITON = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  console.keyMap = "pl2";
}
