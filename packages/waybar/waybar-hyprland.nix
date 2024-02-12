{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    style = ./waybar-hyprland.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        reload_style_on_change = true;
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5];
          };
          format = "{name}: {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
          };
        };
      };
    };
  };
}
