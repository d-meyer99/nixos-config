let
  bi = builtins;
in {
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings =
      bi.fromJSON (bi.unsafeDiscardStringContext (bi.readFile
          ./theme.omp.json));
  };
}
