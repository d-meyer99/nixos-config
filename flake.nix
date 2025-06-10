{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
  in {
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
        lib = nixpkgs.lib;
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
