{ pkgs, lib, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../common/boot.nix
    (import ../common/networking.nix { hostName = "nixos-vm"; })
    ./desktop.nix
    (import ../common/users.nix {
      pkgs = pkgs;
      lib = lib;
      extraGroups = [ "vboxsf" ];
    })
    ../common/postgres.nix
    ../common/audio.nix
    (import ../common/xdg.nix {
      pkgs = pkgs;
      lib = lib;
      extraPortals = [];
    })
    ../common/fonts.nix
    ./packages.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh.enable = true;

  environment.localBinInPath = true;

  system.stateVersion = "24.05";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
