let
  colors = import ../../utils/colors.nix;
  scheme = colors.schemes.blue_toned;
  removeHash = builtins.substring (1) (-1);
in {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "SauceCodePro Nerd Font Mono:size=12";
        font-bold = "SauceCodePro Nerd Font Mono:size=12";
        font-italic = "SauceCodePro Nerd Font Mono:size=12";
        font-bold-italic = "SauceCodePro Nerd Font Mono:size=12";
        pad = "10x10";
      };
      cursor = {
        style = "underline";
      };
      colors = {
        alpha = 0.7;
        foreground = removeHash scheme.foreground;
        background = removeHash scheme.background;
        regular0 = removeHash colors.normal.black;
        regular1 = removeHash colors.normal.red;
        regular2 = removeHash colors.normal.green;
        regular3 = removeHash colors.normal.yellow;
        regular4 = removeHash colors.normal.blue;
        regular5 = removeHash colors.normal.magenta;
        regular6 = removeHash colors.normal.cyan;
        regular7 = removeHash colors.normal.white;
        bright0 = removeHash scheme.ghost_text;
        bright1 = removeHash colors.bright.red;
        bright2 = removeHash colors.bright.green;
        bright3 = removeHash colors.bright.yellow;
        bright4 = removeHash colors.bright.blue;
        bright5 = removeHash colors.bright.magenta;
        bright6 = removeHash colors.bright.cyan;
        bright7 = removeHash colors.bright.white;
        "16" = removeHash colors.other.blood_orange;
        "17" = removeHash colors.other.purple;
        "18" = removeHash colors.other.orange;
        "19" = removeHash colors.other.dark_gray;
        "20" = removeHash colors.other.gray;
        "21" = removeHash colors.other.light_gray;
      };
    };
  };
}
