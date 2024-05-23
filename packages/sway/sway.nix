{ config, ... }:

let
  utils = import ../../utils/utils.nix;
  colors = import ../../utils/colors.nix;
  color_scheme = colors.schemes.blue_toned;

  sway = config.wayland.windowManager.sway;
  mod = sway.config.modifier;
  term = sway.config.terminal;
  left = sway.config.left;
  right = sway.config.right;
  up = sway.config.up;
  down = sway.config.down;

  bindMod = xs: utils.join "+" ([ mod ] ++ xs);
  exec = command: "exec ${command}";
  ws = x: "workspace number ${builtins.toString x}";
  moveToWs = x: "move container to ${ws x}";
in
{
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    systemd.enable = true;
    config = {
      modifier = "Mod4";
      left = "h";
      right = "l";
      up = "k";
      down = "j";
      terminal = "alacritty";

      output = {
        "*".bg = "~/Wallpaper/wallpaper.jpg fill";
        Virtual-1 = {
          resolution = "1920x1080@59.963Hz";
          position = "0 0";
        };
      };

      input."*" = {
        xkb_layout = "pl,pl,gb";
        xkb_variant = ",dvorak,dvorak";
      };

      keybindings = {
        "${bindMod ["Return"]}" = exec term;
        "${bindMod ["q"]}" = "kill";
        "${bindMod ["o"]}" = exec "rofi -show drun -show-icons";
        "${bindMod ["Shift" "c"]}" = "reload";
        "${bindMod ["m"]}" =
            exec "swaynag -t warning -m 'Exit Sway?' -B 'Yes' 'swaymsg exit'";

        # Move Focus with h, j, k, l
        "${bindMod [left]}" = "focus left";
        "${bindMod [right]}" = "focus right";
        "${bindMod [up]}" = "focus up";
        "${bindMod [down]}" = "focus down";

        # Move Focus with arrow keys
        "${bindMod ["Left"]}" = "focus left";
        "${bindMod ["Right"]}" = "focus right";
        "${bindMod ["Up"]}" = "focus up";
        "${bindMod ["Down"]}" = "focus down";

        # Move Focused window with shift + h, j, k, l
        "${bindMod ["Shift" left]}" = "move left";
        "${bindMod ["Shift" right]}" = "move right";
        "${bindMod ["Shift" up]}" = "move up";
        "${bindMod ["Shift" down]}" = "move down";

        # Move Focused winow with shift + arrow keys
        "${bindMod ["Shift" "Left"]}" = "move left";
        "${bindMod ["Shift" "Right"]}" = "move right";
        "${bindMod ["Shift" "Up"]}" = "move up";
        "${bindMod ["Shift" "Down"]}" = "move down";

        # Switch to workspace
        "${bindMod [ "1" ]}" = ws 1;
        "${bindMod [ "2" ]}" = ws 2;
        "${bindMod [ "3" ]}" = ws 3;
        "${bindMod [ "4" ]}" = ws 4;
        "${bindMod [ "5" ]}" = ws 5;
        "${bindMod [ "6" ]}" = ws 6;
        "${bindMod [ "7" ]}" = ws 7;
        "${bindMod [ "8" ]}" = ws 8;
        "${bindMod [ "9" ]}" = ws 9;
        # "${bindMod [ "0" ]}" = ws 10;

        # Move focused container to workspace
        "${bindMod [ "Shift" "1" ]}" = moveToWs 1;
        "${bindMod [ "Shift" "2" ]}" = moveToWs 2;
        "${bindMod [ "Shift" "3" ]}" = moveToWs 3;
        "${bindMod [ "Shift" "4" ]}" = moveToWs 4;
        "${bindMod [ "Shift" "5" ]}" = moveToWs 5;
        "${bindMod [ "Shift" "6" ]}" = moveToWs 6;
        "${bindMod [ "Shift" "7" ]}" = moveToWs 7;
        "${bindMod [ "Shift" "8" ]}" = moveToWs 8;
        "${bindMod [ "Shift" "9" ]}" = moveToWs 9;
        # "${bindMod [ "Shift" "0" ]}" = moveToWs 10;

        "${bindMod [ "e" ]}" = "layout toggle split";
        "${bindMod [ "t" ]}" = "layout tabbed";
        "${bindMod [ "Shift" "t" ]}" = "layout stacking";
        "${bindMod [ "a" ]}" = "focus parent";
        "${bindMod [ "Shift" "a" ]}" = "focus child";
        "${bindMod [ "Shift" "f" ]}" = "fullscreen";
        "${bindMod [ "f" ]}" = "floating toggle";
        "${bindMod [ "s" ]}" = "scratchpad show";
        "${bindMod [ "Shift" "s" ]}" = "move scratchpad";
        "${bindMod [ "space" ]}" = "focus mode_toggle";
        "${bindMod [ "Shift" "space" ]}" = "exec change_layout";
        "${bindMod [ "Shift" "p" ]}" = "exec change_variant";
        "${bindMod [ "r" ]}" = "mode resize";
      };

      modes = {
        resize = {
          "${left}" = "resize shrink width 10px";
          "${right}" = "resize grow width 10px";
          "${up}" = "resize shrink height 10px";
          "${down}" = "resize grow height 10px";

          left = "resize shrink width 10px";
          right = "resize grow width 10px";
          up = "resize shrink height 10px";
          down = "resize grow height 10px";

          return = "mode default";
          escape = "mode default";
        };
      };

      window = {
        border = 2;
        titlebar = false;
      };

      floating = {
        modifier = mod;
        border = 2;
      };

      bars = [
        { command = "waybar"; }
      ];

      gaps = {
        top = -5;
        inner = 10;
      };

      colors = {
        focused = {
          border = color_scheme.primary;
          background = color_scheme.background;
          text = color_scheme.foreground;
          indicator = color_scheme.tertiary;
          childBorder = color_scheme.primary;
        };
        focusedInactive = {
          border = colors.other.steel;
          background = colors.other.steel;
          text = colors.other.dark_gray;
          indicator = color_scheme.background;
          childBorder = colors.other.steel;
        };
        unfocused = {
          border = colors.other.dark_gray;
          background = color_scheme.background;
          text = color_scheme.foreground;
          indicator = color_scheme.background;
          childBorder = color_scheme.background;
        };
      };
    };
    extraConfig = ''
    for_window [class="^.*"] border pixel 2
    exec mako
    '';
  };
}
