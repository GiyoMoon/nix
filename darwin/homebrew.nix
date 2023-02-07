{ config, lib, pkgs, ... }:

{
  homebrew.enable = true;
  homebrew.onActivation.upgrade = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = true;

  homebrew.taps = [
    "homebrew/cask"
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/core"
    "homebrew/services"
    "koekeishiya/formulae"
    "zegl/tap"
    "nicoverbruggen/homebrew-cask"
  ];

  homebrew.brews = [
    "yabai"
    "skhd"
    "rustup-init"
    "zegl/tap/git-linearize"

    # Needed for Laravel Valet...
    "php@8.1"
    "composer"
    "nginx"
    "dnsmasq"
    "mysql"

    # blink-admin
    "pkg-config"
    "imagemagick"
    "pcre2"
    "redis"
  ];

  homebrew.casks = [
    "raycast"
    "aldente"
    "ubersicht"
    "vscodium"
    "kitty"
    "docker"
    "vlc"
    "insomnia"
    "licecap"
    "pika"
    "gimp"
    "qbittorrent"
    "spotify"
    "android-file-transfer"

    # blink-admin
    "nicoverbruggen/homebrew-cask/phpmon"

    # browsers
    "firefox-developer-edition"
    "google-chrome"

    # communication
    "discord"

    "parsec"
    "blender"
    "stremio"
  ];

  homebrew.masApps = {
    "WireGuard" = 1451685025;
    "Unsplash Wallpapers" = 1284863847;
  };
}
