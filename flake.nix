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

  outputs = { self, darwin, nixpkgs, home-manager }:
  let 
    inherit (darwin.lib) darwinSystem;
    nixpkgsConfig = {
      config = { allowUnfree = true; };
      overlays = attrValues self.overlays;
    };
  in
  {
    homeManagerStateVersion = "22.05";

    primaryUserInfo = {
      username = "giyomoon";
    }

    darwinConfigurations = rec {
      JasisMacBook = darwinSystem {
        system = "aarch64-darwin";
        modules = attrValues self.darwinModules ++ [
          home-manager.darwinModules.home-manager
          (
            { config, lib, pkgs, ... }:
            let
               inherit (config.users) primaryUser;
            in
            {
              nixpkgs = nixpkgsConfig;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${primaryUser.username} = {
                imports = attrValues self.homeManagerModules;
                home.stateVersion = homeManagerStateVersion;
              };
            }
          )
          users.primaryUser = primaryUserInfo;
        ];
      };
    };

    darwinModules = {
      giyomoon-defaults = import ./darwin/defaults.nix;
      giyomoon-general = import ./darwin/general.nix;
      # giyomoon-homebrew = import ./config/homebrew.nix;
    };

    homeManagerModules = {
      giyomoon-packages = import ./home/packages.nix;
    };
  };
}