{ lib, ... }:

let
  taps = [
    "homebrew/cask-versions"
    "homebrew/services"
    # yabai and skhd
    "koekeishiya/formulae"
  ];

  brews = [
    "skhd"
    "yabai"
    "handbrake"
  ];

  casks = [
    "1password"
    "aldente"
    "android-commandlinetools"
    "arc"
    "beekeeper-studio"
    "bruno"
    "discord"
    "docker"
    "firefox"
    "gimp"
    "google-chrome"
    "handbrake"
    "hoppscotch"
    "kitty"
    "licecap"
    "obsidian"
    "parsec"
    "pika"
    "prismlauncher"
    "qbittorrent"
    "raycast"
    "stremio"
    "ubersicht"
    "vlc"
    "yaak"
    "zen-browser"

    "steam"
    "minecraft"
  ];

  mas = [
    {
      name = "WireGuard";
      id = "1451685025";
    }
  ];
in
{
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".Brewfile" = {
    text =
      (lib.concatMapStrings (
        tap:
        ''tap "''
        + tap
        + ''
          "
        ''
      ) taps)
      + (lib.concatMapStrings (
        brew:
        ''brew "''
        + brew
        + ''
          "
        ''
      ) brews)
      + (lib.concatMapStrings (
        cask:
        ''cask "''
        + cask
        + ''
          "
        ''
      ) casks)
      + (lib.concatMapStrings ({ name, id }: ''mas "'' + name + ''", id: '' + id + "\n") mas);
  };
}
