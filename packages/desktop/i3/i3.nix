{ lib, ... }:

let
  utils = import ../../../utils/utils.nix;
  colors = import ../../../utils/colors.nix;
  color_scheme = colors.schemes.blue_toned;

  mod = "Mod4";
  term = "alacritty";
  left = "h";
  right = "l";
  up = "k";
  down = "j";

  bindMod = xs: utils.join "+" ([ mod ] ++ xs);
  ws = x: "${toString x}";
  moveToWs = x: "move container to workspace ${ws x}";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = term;

      keybindings = lib.mkOptionDefault ({
        # Launch terminal and apps
        "${bindMod [ "Return" ]}" = "exec ${term}";
        "${bindMod [ "o" ]}" = "exec rofi -show drun -show-icons";
        "${bindMod [ "q" ]}" = "kill";

        # Reload & exit
        "${bindMod [
          "Shift"
          "c"
        ]}" =
          "reload";
        "${bindMod [ "m" ]}" =
          "exec --no-startup-id i3-nagbar -t warning -m 'Exit i3?' -b 'Yes' 'i3-msg exit'";

        # Focus movement
        "${bindMod [ left ]}" = "focus left";
        "${bindMod [ right ]}" = "focus right";
        "${bindMod [ up ]}" = "focus up";
        "${bindMod [ down ]}" = "focus down";

        "${bindMod [ "Left" ]}" = "focus left";
        "${bindMod [ "Right" ]}" = "focus right";
        "${bindMod [ "Up" ]}" = "focus up";
        "${bindMod [ "Down" ]}" = "focus down";

        # Move windows
        "${bindMod [
          "Shift"
          left
        ]}" =
          "move left";
        "${bindMod [
          "Shift"
          right
        ]}" =
          "move right";
        "${bindMod [
          "Shift"
          up
        ]}" =
          "move up";
        "${bindMod [
          "Shift"
          down
        ]}" =
          "move down";

        "${bindMod [
          "Shift"
          "Left"
        ]}" =
          "move left";
        "${bindMod [
          "Shift"
          "Right"
        ]}" =
          "move right";
        "${bindMod [
          "Shift"
          "Up"
        ]}" =
          "move up";
        "${bindMod [
          "Shift"
          "Down"
        ]}" =
          "move down";

        # Workspace switching
        "${bindMod [ "1" ]}" = "workspace ${ws 1}";
        "${bindMod [ "2" ]}" = "workspace ${ws 2}";
        "${bindMod [ "3" ]}" = "workspace ${ws 3}";
        "${bindMod [ "4" ]}" = "workspace ${ws 4}";
        "${bindMod [ "5" ]}" = "workspace ${ws 5}";
        "${bindMod [ "6" ]}" = "workspace ${ws 6}";
        "${bindMod [ "7" ]}" = "workspace ${ws 7}";
        "${bindMod [ "8" ]}" = "workspace ${ws 8}";
        "${bindMod [ "9" ]}" = "workspace ${ws 9}";

        # Move windows to workspaces
        "${bindMod [
          "Shift"
          "1"
        ]}" =
          moveToWs 1;
        "${bindMod [
          "Shift"
          "2"
        ]}" =
          moveToWs 2;
        "${bindMod [
          "Shift"
          "3"
        ]}" =
          moveToWs 3;
        "${bindMod [
          "Shift"
          "4"
        ]}" =
          moveToWs 4;
        "${bindMod [
          "Shift"
          "5"
        ]}" =
          moveToWs 5;
        "${bindMod [
          "Shift"
          "6"
        ]}" =
          moveToWs 6;
        "${bindMod [
          "Shift"
          "7"
        ]}" =
          moveToWs 7;
        "${bindMod [
          "Shift"
          "8"
        ]}" =
          moveToWs 8;
        "${bindMod [
          "Shift"
          "9"
        ]}" =
          moveToWs 9;

        # Layouts
        "${bindMod [ "e" ]}" = "layout toggle split";
        "${bindMod [ "t" ]}" = "layout tabbed";
        "${bindMod [
          "Shift"
          "t"
        ]}" =
          "layout stacking";
        "${bindMod [ "f" ]}" = "floating toggle";
        "${bindMod [
          "Shift"
          "f"
        ]}" =
          "fullscreen";

        # Misc
        "${bindMod [ "space" ]}" = "focus mode_toggle";
        "${bindMod [ "s" ]}" = "scratchpad show";
        "${bindMod [
          "Shift"
          "s"
        ]}" =
          "move scratchpad";
        "${bindMod [ "a" ]}" = "focus parent";
        "${bindMod [
          "Shift"
          "a"
        ]}" =
          "focus child";

        # Resize mode
        "${bindMod [ "r" ]}" = "mode resize";
      });

      modes = {
        resize = {
          "${left}" = "resize shrink width 10 px or 10 ppt";
          "${right}" = "resize grow width 10 px or 10 ppt";
          "${up}" = "resize shrink height 10 px or 10 ppt";
          "${down}" = "resize grow height 10 px or 10 ppt";
          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      gaps = {
        inner = 10;
        outer = 0;
        smartBorders = "on";
      };

      floating = {
        modifier = mod;
        border = 2;
      };

      window = {
        border = 2;
        titlebar = false;
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

      fonts = {
        names = ["AurulentSansM Nerd Font"];
        size = 10.0;
      };

      bars = [
        {
          statusCommand = "i3status";
          position = "top";
          trayOutput = "none"; # Set to "primary" if you later use trayer
        }
      ];

      startup = [
        {
          command = "i3-msg workspace 1";
          always = true;
          notification = false;
        }
      ];
    };

    extraConfig = ''
      for_window [class="^.*"] border pixel 2
      exec_always --no-startup-id feh --bg-fill ~/Wallpaper/wallpaper.jpg
    '';
  };
}
