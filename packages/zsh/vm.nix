let
  myAliases = {
    v = "nvim";
    vnix-conf = "nvim ~/.dotfiles/hosts/default/configuration.nix";
    vnix-home = "nvim ~/.dotfiles/hosts/default/home.nix";
    nixos-test = "sudo nixos-rebuild test --flake /home/dm/.dotfiles#virtual-box";
    nixos-switch =
      "sudo nixos-rebuild switch --flake /home/dm/.dotfiles#virtual-box";
    hm-switch = "home-manager switch --flake /home/dm/.dotfiles#vm-dm";
    ll = "ls -la";
  };

  ohMyPoshThemePath = ".config/oh-my-posh/theme.omp.json";
in
{
  home.file.${ohMyPoshThemePath}.source =
    ../../packages/oh-my-posh/theme.omp.json;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initExtra = ''
      eval "$(oh-my-posh init zsh --config /home/dm/${ohMyPoshThemePath})"
    '';
    loginExtra = ''
      dbus-run-session sway
    '';
  };
}
