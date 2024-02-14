{lib, ...}:
{
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
          "sway/window"
        ];
        modules-center = lib.mkForce [ 
          "sway/workspaces"
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
          format = "{:.100}";
          rewrite = {
            "(.*) - Brave" = " $1";
            "Alacritty" = " $0";
            "" = " Sway";
          };
        };
      };
    };
  };
}
