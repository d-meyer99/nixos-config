let
  isVm = false;
  aliases = (import ./aliases.nix) isVm;
in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = aliases;
    loginExtra = ''
      dbus-run-session Hyprland
    '';
  };
}
