{pkgs, ...}: let
  extraPackages = with pkgs; [
    swww
    xdg-desktop-portal-hyprland
    spotify
    yt-dlp
    vlc
    blueman
    discord
    _1password-gui

    texlive.combined.scheme-full
  ];
  allPackages =
    (
      import ../common-packages.nix {pkgs = pkgs;}
    )
    ++ extraPackages;
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "thinkpad"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "pl";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dm = {
    isNormalUser = true;
    description = "Dominik Meyer";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.bash;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installed Packages
  environment.systemPackages = allPackages;

  # Fonts
  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    vistafonts
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.zsh.enable = true;

  environment.sessionVariables = {
    # If cursor becomes invisible
    #  WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
  ];

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.blueman.enable = true;

  environment.localBinInPath = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [5173 4173];
  networking.firewall.allowedUDPPorts = [5173 4173];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
