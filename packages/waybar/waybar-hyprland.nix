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
        margin = "5 5 0 5";
        modules-left = [
          "hyprland/window"
        ];
        modules-center = [ 
          "hyprland/workspaces"
        ];
        modules-right = [
         "battery"
        ];
        reload_style_on_change = true;
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 ];
          };
          format = "{icon}";
          format-icons = {
            "default" = "";
            "persistent" = "󰓏";
            "active" = "󰗠";
          };
        };
        "hyprland/window" = {
          format = "{:.75}";
          rewrite = {
            "(.*) - Brave" = " $1";
            "Alacritty" = " $0";
          };
        };
        battery = {
          format = "{icon}{capacity:3}%";
          states = {
            warning = 40;
            critical = 20;
          };
          format-charging = "󰂄{capacity:3}%";
          format-plugged = "󰚥{capacity:3}%";
          format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
        };
      };
    };
  };
}
