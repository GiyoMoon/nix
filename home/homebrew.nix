{ lib, ... }:

let
  taps = [
    "homebrew/services"
    # yabai and skhd
    "koekeishiya/formulae"
    "mac-cleanup/mac-cleanup-py"
    # sketchybar
    "FelixKratz/formulae"
  ];

  brews = [
    "mac-cleanup-py"
    "monero"
    "sketchybar"
    "skhd"
    "yabai"
    "media-control"
    "asheshgoplani/tap/agent-deck"
  ];

  casks = [
    "1password"
    "aldente"
    "android-commandlinetools"
    "bambu-studio"
    "beekeeper-studio"
    "blender"
    "bruno"
    "discord"
    "firefox"
    "freecad"
    "gimp"
    "godot"
    "google-chrome"
    "halloy"
    "handbrake-app"
    "kicad"
    "kitty"
    "krita"
    "libreoffice"
    "licecap"
    "monero-wallet"
    "obsidian"
    "openscad"
    "orbstack"
    "orcaslicer"
    "parsec"
    "pdfsam-basic"
    "pika"
    "prismlauncher"
    "qbittorrent"
    "raycast"
    "steam"
    "stremio"
    "teamspeak-client"
    "teamspeak-client@beta"
    "utm"
    "vlc"
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
      ) casks);
  };
}
