{lib, ...}:
let
  isVm = true;
  aliases = (import ./aliases.nix) isVm;
in
{
  imports = [
    ./thinkpad.nix
  ];
  programs.bash = {
    shellAliases = lib.mkForce aliases;
    profileExtra = lib.mkForce '''';
  };
}

