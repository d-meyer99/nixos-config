let
  bi = builtins;
  template = bi.readFile ./theme.omp.json;
  theme = bi.attrValues (import ../../../utils/colors.nix).schemes.omp.vm;
  keys = ["$PROMPT$" "$PATH$" "$GIT$" "$SUCCESS$" "$ERROR$"];
  config = bi.replaceStrings keys theme template;
in {
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = bi.fromJSON (bi.unsafeDiscardStringContext config);
  };
}
