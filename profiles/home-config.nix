{pkgs, ...}:
{
  home.username = "dm";
  home.homeDirectory = "/home/dm";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    keychain
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
