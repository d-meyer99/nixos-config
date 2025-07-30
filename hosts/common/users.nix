{
  pkgs,
  lib,
  extraGroups ? [ ],
}:
let
  defaultGroups = [
    "networkmanager"
    "wheel"
    "docker"
  ];
  allGroups = lib.lists.unique (defaultGroups ++ extraGroups);
in
{
  users.users.dm = {
    isNormalUser = true;
    description = "Dominik Meyer";
    extraGroups = allGroups;
    shell = pkgs.bash;
  };
}
