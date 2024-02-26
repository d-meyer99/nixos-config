{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    style = ./waybar.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "5 5 0 5";
        modules-left = [
          "network"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "cpu"
          "clock"
          "battery"
        ];
        reload_style_on_change = true;
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [1 2 3 4 5];
          };
          format = "{icon}";
          format-icons = {
            "default" = "";
            "persistent" = "󰓏";
            "active" = "󰗠";
          };
        };
        "hyprland/window" = {
          format = "{:.60}";
          rewrite = {
            "(.*) - Brave" = " $1";
            "Alacritty" = " $0";
            "" = " Hyprland";
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
          format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
        };
        clock = {
          format = " {:%a, %b %d, %Y  | %R } ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffcb6b'><b>{}</b></span>";
              days = "<span color='#ffdddd'><b>{}</b></span>";
              weeks = "<span color='#773333'><b>W{}</b></span>";
              weekdays = "<span color='#772172'><b>{}</b></span>";
              today = "<span color='#ee5168'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        cpu = {
          interval = 5;
          format = "  {load}% {icon}";
          format-icons = [
            "<span color='#69ff94'>▁</span>"
            "<span color='#66eeff'>▂</span>"
            "<span color='#ddddff'>▃</span>"
            "<span color='#ffdddd'>▄</span>"
            "<span color='#ffcb66'>▅</span>"
            "<span color='#ffcb33'>▆</span>"
            "<span color='#f7812c'>▇</span>"
            "<span color='#ee5168'>█</span>"
          ];
        };
        network = {
          format-wifi = "{signalStrength}% ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = "{essid}";
          interval = 7;
          on-click = "rofi-wifi-menu";
        };
      };
    };
  };
}
