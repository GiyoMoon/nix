{
  description = "Jasi's Nix configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let 
    inherit (darwin.lib) darwinSystem;
    inherit (inputs.nixpkgs-unstable.lib) attrValues optionalAttrs singleton;
    nixpkgsConfig = {
      config = { allowUnfree = true; };
      overlays = singleton (
          final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            inherit (final.pkgs-x86) starship; # TODO: remove when https://github.com/NixOS/nixpkgs/issues/160876 is fixed.
          })
        );
    };
  in
  {
    homeManagerStateVersion = "22.05";

    darwinConfigurations = rec {
      JasisMacBook = darwinSystem {
        system = "aarch64-darwin";
        modules = attrValues self.darwinModules ++ [
          home-manager.darwinModules.home-manager
          (
            { config, lib, pkgs, ... }:

            {
              nixpkgs = nixpkgsConfig;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.giyomoon = {
                imports = attrValues self.homeManagerModules;
                home.stateVersion = self.homeManagerStateVersion;
              };
            }
          )
        ];
      };
    };

    darwinModules = {
      giyomoon-defaults = import ./darwin/defaults.nix;
      giyomoon-general = import ./darwin/general.nix;
      giyomoon-homebrew = import ./darwin/homebrew.nix;
    };

    homeManagerModules = {
      giyomoon-packages = import ./home/packages.nix;
      giyomoon-git = import ./home/programs/git.nix;
      giyomoon-fish = import ./home/programs/fish.nix;
      giyomoon-starship = import ./home/programs/starship.nix;
    };
  };
}