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
    "visual-studio-code"
    "kitty"
    "docker"
    "spotify"

    # browsers
    "firefox"
    "google-chrome"
    "microsoft-edge"
    "microsoft-auto-update"

    # tools
    "insomnia"
    "licecap"
    "pika"

    # communication
    "discord"
    "slack"
    "telegram-desktop"
  ];

  # Fallback for packages which don't work well with nix...
  homebrew.brews = [
    "rustup-init"
    "libpq"
  ];

  homebrew.extraConfig = ''
    brew "libpq", link: true
  '';
}