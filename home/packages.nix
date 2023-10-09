{ pkgs, ... }:

{
  programs.bat.enable = true;

  home.packages = with pkgs; [
    # basics
    coreutils
    curl
    eza
    thefuck
    wget
    bat
    cloc
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
    nodejs_20
    cmake
    libwebp
    bun
  ];
}
