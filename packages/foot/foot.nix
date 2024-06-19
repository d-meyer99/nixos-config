let
  colors = import ../../utils/colors.nix;
in {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "SauceCodePro Nerd Font Mono:size=9";
        font-bold = "SauceCodePro Nerd Font Mono:size=9";
        font-italic = "SauceCodePro Nerd Font Mono:size=9";
        font-bold-italic = "SauceCodePro Nerd Font Mono:size=9";
      };
      cursor ={
        style = "underline";
        color = "ddddff";
      };
      
    };
  };
}
