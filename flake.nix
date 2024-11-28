{
  description = "Jasi's macOS nix config 🦇";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
    simple-bar = {
      url = "github:Jean-Tinland/simple-bar";
      flake = false;
    };
    puffer-fish = {
      url = "github:nickeb96/puffer-fish";
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
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (nixpkgs.lib.getName pkg) [
            "lens-desktop"
          ];
      };
    in
    {
      nix.extraOptions = ''
        auto-optimise-store = true
        experimental-features = nix-command flakes
      '';

      homeConfigurations.jasi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          nixvim.homeManagerModules.nixvim
          ./home/home.nix
        ];
      };
    };
}
