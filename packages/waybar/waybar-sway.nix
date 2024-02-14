{lib, ...}:
{
  imports = [
    ./waybar-hyprland.nix
  ];

  programs.waybar = {
    systemd.target = lib.mkForce "sway-session.target";
    settings = {
      mainBar = {
        modules-center = lib.mkForce [ 
          "sway/workspaces"
        ];
        "sway/workspaces" = {
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
      };
    };
  };
}
