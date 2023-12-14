{ config, lib, pkgs, ... }:

{
  homebrew.enable = true;
  homebrew.onActivation.upgrade = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = true;

  homebrew.taps = [
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/services"
    "koekeishiya/formulae"
    "leoafarias/fvm"
  ];

  homebrew.brews = [
    "yabai"
    "skhd"
    "rustup-init"

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

    # Flutter version manager
    "fvm"
  ];

  homebrew.casks = [
    "raycast"
    "aldente"
    "ubersicht"
    "vscodium"
    "kitty"
    "docker"
    "vlc"
    "bruno"
    "licecap"
    "pika"
    "gimp"
    "qbittorrent"
    "blender"
    "blockbench"
    "godot"
    "steam"
    "obsidian"
    "beekeeper-studio"
    "mullvadvpn"
    "android-file-transfer"
    "1password"
    "handbrake"

    # browsers
    "firefox-developer-edition"
    "google-chrome"
    "arc"
    "tor-browser"

    # communication
    "discord"

    "parsec"
    "stremio"

    # Java, android development
    "temurin17"
    "android-commandlinetools"
  ];

  homebrew.masApps = {
    "WireGuard" = 1451685025;
  };
}
