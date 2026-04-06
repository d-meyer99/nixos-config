{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "d-meyer99";
        email = "d.meyer99@hotmail.com";
      };
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
    signing.format = "openpgp";
  };
}
