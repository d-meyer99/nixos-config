let
  isVm = false;
  aliases = (import ./aliases.nix) isVm;
in
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
    profileExtra = ''
      dbus-run-session Hyprland
    '';
  };

  home.file.".local/bin/".source = ../../scripts;
}
