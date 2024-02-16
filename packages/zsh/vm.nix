let
  isVm = true;
  aliases = (import ./aliases.nix) isVm;

  ohMyPoshThemePath = ".config/oh-my-posh/theme.omp.json";
in
{
  home.file.${ohMyPoshThemePath}.source =
    ../../packages/oh-my-posh/theme.omp.json;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = aliases;
    initExtra = ''
      eval "$(oh-my-posh init zsh --config /home/dm/${ohMyPoshThemePath})"
    '';
    loginExtra = ''
      dbus-run-session sway
    '';
  };
}
