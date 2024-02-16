{pkgs, ...}:
{
  home.username = "dm";
  home.homeDirectory = "/home/dm";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    keychain
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
