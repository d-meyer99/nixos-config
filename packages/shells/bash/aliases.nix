let
  aliases =
    isVm: let
      config = if isVm
        then {host = "virtual-box"; prof = "vm-dm"; }
      else {host = "default"; prof = "hm-only"; };
    in
    {
      v = "nvim";
      nixos-test =
        "sudo nixos-rebuild test --flake /home/dm/.dotfiles#${config.host}";
      nixos-switch =
        "sudo nixos-rebuild switch --flake /home/dm/.dotfiles#${config.host}";
      hm-switch = 
        "home-manager switch --flake /home/dm/.dotfiles#${config.prof}";
      ll = "ls -la";
      nshell = "nix-shell";
    };
in
aliases

