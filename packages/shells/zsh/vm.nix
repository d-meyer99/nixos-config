{lib, ...}:
let
  isVm = true;
  aliases = (import ./aliases.nix) isVm;
in
{
  imports = [
    ./thinkpad.nix
  ];
  programs.zsh = {
    shellAliases = lib.mkForce aliases;
    loginExtra = lib.mkForce "
    if [[ -z $DISPLAY && $TTY = /dev/tty1 ]]; then
      exec sway
    fi";
  };
}
