let
  aliases =
    isVm: let
      config = if isVm
        then {host = "virtual-box"; prof = "vm-dm"; }
      else {host = "default"; prof = "dm"; };
    in
    {
      v = "nvim";
      vnix-conf = "nvim ~/.dotfiles/hosts/default/configuration.nix";
      vnix-home = "nvim ~/.dotfiles/hosts/default/home.nix";
      nixos-test =
        "sudo nixos-rebuild test --flake/home/dm/.dotfiles#${config.host}";
      nixos-switch =
        "sudo nixos-rebuild switch --flake /home/dm/.dotfiles#${config.host}";
      hm-switch = 
        "home-manager switch --flake /home/dm/.dotfiles#${config.prof}";
      ll = "ls -la";
    };
in
aliases
