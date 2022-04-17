{ pkgs, ... }:

{
  programs.bat.enable = true;

  home.packages = with pkgs; [
    # basics
    coreutils
    curl
    exa
    thefuck
    wget
    bat
    pinentry_mac

    # dev
    nodePackages.gitmoji-cli
    nodePackages.npm-check-updates
    yarn
    nodejs-16_x
  ];
}
