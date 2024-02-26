{lib, ...}: {
  imports = [
    ./waybar-hyprland.nix
  ];

  programs.waybar = {
    systemd.target = lib.mkForce "sway-session.target";
    style = lib.mkForce ./waybar-vm.css;
    settings = {
      mainBar = {
        margin = lib.mkForce "5";
        modules-left = lib.mkForce [
          "sway/language"
          "sway/window"
        ];
        modules-center = lib.mkForce [
          "sway/workspaces"
        ];
        modules-right = lib.mkForce [
          "cpu"
          "clock"
        ];
        "sway/workspaces" = {
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
          format = "{icon}";
          format-icons = {
            "1" = "󰓏";
            "2" = "󰓏";
            "3" = "󰓏";
            "4" = "󰓏";
            "5" = "󰓏";
            "default" = "";
            "focused" = "󰗠";
          };
        };
        "sway/window" = {
          format = "{:.80}";
          rewrite = {
            "(.*) - Brave" = " $1";
            "Alacritty" = " $0";
            "" = " Sway";
          };
        };
        "sway/language" = {
          format = "{short} {variant}";
          on-click = "change_layout";
        };
        clock.calendar.format = lib.mkForce {
              months = "<span color='#ffcb6b'><b>{}</b></span>";
              days = "<span color='#ffdddd'><b>{}</b></span>";
              weeks = "<span color='#444488'><b>W{}</b></span>";
              weekdays = "<span color='#66aabb'><b>{}</b></span>";
              today = "<span color='#4288ee'><b><u>{}</u></b></span>";
        };
      };
    };
  };
}
