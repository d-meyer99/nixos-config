{
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
      colors = {
        primary = {
          background = "#2a2222";
          foreground = "#ffdddd";
        };
        cursor = {
          text = "#332222";
          cursor = "#ffdddd";
        };
        normal = {
          black   = "#332222";
          red     = "#ee5168";
          green   = "#336823";
          yellow  = "#ffcb6b";
          blue    = "#4288cc";
          magenta = "#f762ca";
          cyan    = "#66aabb";
          white   = "#ffdddd";
        };
        bright = {
          black   = "#773333";
          red     = "#ee5168";
          green   = "#83c85d";
          yellow  = "#ffcb6b";
          blue    = "#4288cc";
          magenta = "#f762ca";
          cyan    = "#66aabb";
          white   = "#ffdddd";
        };
        indexed_colors =[
          { index = 16; color = "#b7512c"; }
          { index = 17; color = "#ff5370"; }
          { index = 18; color = "#303030"; }
          { index = 19; color = "#353535"; }
          { index = 20; color = "#b2ccd6"; }
          { index = 21; color = "#eeffff"; }
        ];
      };
      cursor = {
        style = "Underline";
      };
      live_config_reload = true;
      keyboard.bindings = [
        { key = "Key0"; mods = "Control"; action = "ResetFontSize"; }
        { key = "Equals"; mods = "Control"; action = "IncreaseFontSize"; }
        { key = "Minus"; mods = "Control"; action = "DecreaseFontSize"; }
      ];
    };
  };
}
