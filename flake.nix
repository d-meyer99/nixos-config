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
      };

      homeConfigurations = {
        dm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/default/home.nix
          ];
        };
      };
  };
}
