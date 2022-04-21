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
    "warp"
    "docker"

    # browsers
    "firefox"
    "google-chrome"
    "microsoft-edge"
    "microsoft-auto-update"

    # tools
    "insomnia"
    "licecap"

    # communication
    "discord"
    "slack"
    "telegram-desktop"
  ];
}