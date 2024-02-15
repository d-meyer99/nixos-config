{lib, ...}:
{
  imports = [
    ./alacritty.nix
  ];

  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.70;
    font.size = lib.mkForce 12;
    colors = {
      primary = {
        background = lib.mkForce "#222233";
        foreground = lib.mkForce "#ddddff";
      };
      cursor = {
        text = lib.mkForce "#222233";
        cursor = lib.mkForce "#ddddff";
      };
      normal = {
        black   = lib.mkForce "#222233";
        red     = lib.mkForce "#ee5168";
        green   = lib.mkForce "#336823";
        yellow  = lib.mkForce "#ffcb6b";
        blue    = lib.mkForce "#4288cc";
        magenta = lib.mkForce "#f762ca";
        cyan    = lib.mkForce "#66aabb";
        white   = lib.mkForce "#ffdddd";
      };
      bright = {
        black   = lib.mkForce "#444488";
        red     = lib.mkForce "#ee5168";
        green   = lib.mkForce "#83c85d";
        yellow  = lib.mkForce "#ffcb6b";
        blue    = lib.mkForce "#4288cc";
        magenta = lib.mkForce "#f762ca";
        cyan    = lib.mkForce "#66aabb";
        white   = lib.mkForce "#ffdddd";
      };
      indexed_colors = lib.mkForce [
      { index = 16; color = "#b7512c"; }
      { index = 17; color = "#ff5370"; }
      { index = 18; color = "#303030"; }
      { index = 19; color = "#353535"; }
      { index = 20; color = "#b2ccd6"; }
      { index = 21; color = "#eeffff"; }
      ];
    };
  };
}
