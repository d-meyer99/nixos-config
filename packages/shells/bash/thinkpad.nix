let
  isVm = false;
  aliases = (import ./aliases.nix) isVm;
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
    profileExtra = ''
      if [[ -z $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
          dbus-run-session Hyprland
      fi'';
    bashrcExtra = ''
      PS1="\[\e[38;5;80m\]bash:\[\e[38;5;182;1m\]\w\$\[\e[0m\] ";
      if [[ -z $TMUX ]]; then
          tmux-init;
      fi
      export GOTMPDIR=/home/dm/.go/
    '';
  };

  home.file.".local/bin/".source = ../../../scripts;
}
