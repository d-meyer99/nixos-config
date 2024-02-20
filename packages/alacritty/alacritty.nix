let
  colors = import ../../utils/colors.nix;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.7;
        blur = true;
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
        decorations = "none";
      };
      font = {
        normal.family = "SauceCodePro Nerd Font Mono";
        bold.family = "SauceCodePro Nerd Font Mono";
        italic.family = "SauceCodePro Nerd Font Mono";
        bold_italic.family = "SauceCodePro Nerd Font Mono";
        size = 9;
      };
      colors = colors.getAlacrittyColors colors.schemes.red_neon;
      cursor = {
        style = "Underline";
      };
      live_config_reload = true;
      keyboard.bindings = [
        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }
        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
      ];
    };
  };
}
