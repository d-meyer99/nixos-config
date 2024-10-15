{
  programs.yt-dlp = {
    enable = true;
    extraConfig = ''
      -P ~/YouTube
      -o %(title)s.%(ext)s
    '';
  };
}
