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
  };

  outputs =
    { nixpkgs, home-manager, ... }:

    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nix.extraOptions = ''
        auto-optimise-store = true
        experimental-features = nix-command flakes
      '';

      homeConfigurations.jasi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home/home.nix ];
      };
    };
}
