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
    gnupg
    xmlstarlet
    ripgrep
    neovim
    lazygit
    ydiff
    youtube-dl

    # dev
    nodePackages.gitmoji-cli
    nodePackages.npm-check-updates
    nodePackages.pnpm
    yarn
    nodejs-16_x
    deno
    cmake
  ];
}
