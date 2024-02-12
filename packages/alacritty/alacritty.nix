{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.75;
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
    };
  };
}
