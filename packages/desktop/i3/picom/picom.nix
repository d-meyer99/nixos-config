{
  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    shadow = true;

    settings = {
      inactive-opacity = 0.9;
      active-opacity = 1.0;
      frame-opacity = 0.8;

      fade-in-step = 0.03;
      fade-out-step = 0.03;
      fade-delta = 5;
    };
  };
}
