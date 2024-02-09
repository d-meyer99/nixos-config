{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
    system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      default = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/default/configuration.nix
        ];
      };

      virtual-box = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/virtual-box/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      dm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/dm/home.nix
        ];
      };
      vm-dm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/vm-dm/home.nix
        ];
      };
    };
  };
}
