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
    # lazygit
    # ydiff
    yt-dlp
    nmap
    spotifyd
    spotify-tui
    hadolint

    # dev
    nodePackages.gitmoji-cli
    nodePackages.npm-check-updates
    nodePackages.pnpm
    yarn
    nodejs-18_x
    cmake
    libwebp
    bun
  ];
}
