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
    "zegl/tap"
  ];

  homebrew.casks = [
    "raycast"
    "vscodium"
    "kitty"
    "docker"
    "spotify"
    "vlc"

    # browsers
    "firefox-developer-edition"
    "google-chrome"

    # tools
    "insomnia"
    "licecap"
    "pika"
    "gimp"
    "aldente"

    # communication
    "discord"
    "slack"
    "telegram-desktop"

    "parsec"

    "qbittorrent"
  ];

  # Fallback for packages which don't work well with nix...
  homebrew.brews = [
    "rustup-init"
    "zegl/tap/git-linearize"

    # Needed for Laravel Valet...
    "php@8.1"
    "composer"
    "nginx"
    "dnsmasq"
  ];

  homebrew.masApps = {
    "WireGuard" = 1451685025;
    "Unsplash Wallpapers" = 1284863847;
  };
}
