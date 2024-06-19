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
    bashrcExtra = ''
      PS1="\[\e[38;5;80m\]bash:\[\e[38;5;182;1m\]\w\$\[\e[0m\] ";
    '';
  };

  home.file.".local/bin/".source = ../../scripts;
}
