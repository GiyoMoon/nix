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
  ];

  homebrew.casks = [
    "raycast"
    "aldente"
    "ubersicht"
    # "vscodium"
    # "visual-studio-code"
    "visual-studio-code-insiders"
    "kitty"
    "docker"
    "vlc"
    "insomnia"
    "licecap"
    "pika"
    "gimp"
    "qbittorrent"
    "spotify"
    "blender"
    "blockbench"
    "godot"
    "steam"
    "notable"

    # browsers
    "firefox-developer-edition"
    "google-chrome"
    "arc"

    # communication
    "discord"

    "parsec"
    "stremio"
  ];

  homebrew.masApps = {
    "WireGuard" = 1451685025;
    "Unsplash Wallpapers" = 1284863847;
  };
}
