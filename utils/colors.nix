let
  normal = {
    black = "#222222";
    red = "#aa2131";
    green = "#337a23";
    yellow = "#ffcb33";
    blue = "#2266aa";
    magenta = "#b762ca";
    cyan = "#66aabb";
    white = "#dddddd";
  };

  bright = {
    black = "#777777";
    red = "#ee5168";
    green = "#83c85d";
    yellow = "#ffcb6b";
    blue = "#4288ee";
    magenta = "#f762ca";
    cyan = "#66eeff";
    white = "#ffffff";
  };

  other = {
    orange = "#f7812c";
    purple = "#7721ee";
    violet = "#772172";
    blood_orange = "#b7512c";
    dark_gray = "#444444";
    gray = "#888888";
    light_gray = "#bbbbbb";
    steel = "#b2ccd6";
    dark_red = "#773333";
    dark_blue = "#444488";
    mint = "#69ff94";
  };

  red_neon = {
    background = "#332222";
    foreground = "#ffdddd";
    primary = bright.red;
    secondary = normal.cyan;
    tertiary = other.violet;
    ghost_text = other.dark_red;
  };

  blue_toned = {
    background = "#222233";
    foreground = "#ddddff";
    primary = normal.blue;
    secondary = bright.yellow;
    tertiary = normal.cyan;
    ghost_text = other.dark_blue;
  };

  getAlacrittyColors = {
    background,
    foreground,
    ghost_text,
    ...
  }: {
    primary = {
      background = background;
      foreground = foreground;
    };
    cursor = {
      text = background;
      cursor = foreground;
    };
    normal = normal;
    bright = {
      black = ghost_text;
      green = bright.green;
      yellow = bright.yellow;
      blue = bright.blue;
      magenta = bright.magenta;
      cyan = bright.cyan;
      white = bright.white;
    };
    indexed_colors = [
      {
        index = 16;
        color = other.blood_orange;
      }
      {
        index = 17;
        color = other.purple;
      }
      {
        index = 18;
        color = other.orange;
      }
      {
        index = 19;
        color = other.dark_gray;
      }
      {
        index = 20;
        color = other.gray;
      }
      {
        index = 21;
        color = other.light_gray;
      }
    ];
  };
in {
  schemes = {
    red_neon = red_neon;
    blue_toned = blue_toned;
  };
  normal = normal;
  bright = bright;
  other = other;
  getAlacrittyColors = getAlacrittyColors;
}
