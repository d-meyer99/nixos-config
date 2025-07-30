{pkgs, lib, extraPortals ? [], ...}: 
let 
  defaultPortals = [ pkgs.xdg-desktop-portal-gtk ];
  allPortals = lib.lists.unique (defaultPortals ++ extraPortals);
in
{
  xdg.portal = {
    enable = true;
    extraPortals = allPortals;
    config.common.default = "*";
  };
}
