let
  isVm = false;
  aliases = (import ./aliases.nix) isVm;
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = aliases;
    loginExtra = ''
      dbus-run-session Hyprland
    '';
  };

  home.file.".local/bin/".source = ../../scripts;
}
