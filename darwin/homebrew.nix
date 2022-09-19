{ config, lib, pkgs, ... }:

{
  homebrew.enable = true;
  homebrew.autoUpdate = true;
  homebrew.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.noLock = true;

  homebrew.taps = [
    "homebrew/cask"
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/core"
    "homebrew/services"
  ];

  homebrew.casks = [
    "amethyst"
    "raycast"
    "vscodium"
    "kitty"
    "docker"
    "spotify"
    "vlc"

    # browsers
    "firefox"
    "google-chrome"
    "microsoft-edge"
    "microsoft-auto-update"

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
  ];

  # Fallback for packages which don't work well with nix...
  homebrew.brews = [
    "rustup-init"
    # Needed for Laravel Valet...
    "php@8.1"
    "nginx"
    "dnsmasq"
  ];

  homebrew.masApps = {
    "WireGuard" = 1451685025;
    "Unsplash Wallpapers" = 1284863847;
  };
}
