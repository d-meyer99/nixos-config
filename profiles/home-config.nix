{ pkgs, ... }:
{
  home.username = "dm";
  home.homeDirectory = "/home/dm";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    keychain
  ];

  home.sessionPath = [ ];

  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
