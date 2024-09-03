{
  description = "Jasi's macOS nix config 🦇";

  inputs = {
    # Stable: github:NixOS/nixpkgs/nixos-23.11
    # Unstable: github:NixOS/nixpkgs/nixos-unstable
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cmp-tailwind-colors = {
      url = "github:js-everts/cmp-tailwind-colors";
      flake = false;
    };
    eldritch = {
      url = "github:eldritch-theme/eldritch.nvim";
      flake = false;
    };
    everforest-lua = {
      url = "github:neanias/everforest-nvim";
      flake = false;
    };
    markdown = {
      url = "github:MeanderingProgrammer/markdown.nvim";
      flake = false;
    };
    telescope-recent-files = {
      url = "github:mollerhoj/telescope-recent-files.nvim";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./overlays.nix inputs) ];
      };
    in
    {
      nix.extraOptions = ''
        auto-optimise-store = true
        experimental-features = nix-command flakes
      '';

      homeConfigurations.jasi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          nixvim.homeManagerModules.nixvim
          ./home/home.nix
        ];
      };
    };
}
