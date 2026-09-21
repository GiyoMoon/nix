{ lib, ... }:

let
  taps = [
    "homebrew/services"
    # yabai and skhd
    "koekeishiya/formulae"
    "mac-cleanup/mac-cleanup-py"
    # sketchybar
    "felixkratz/formulae"
  ];

  brews = [
    "mac-cleanup-py"
    "monero"
    "felixkratz/formulae/sketchybar"
    "koekeishiya/formulae/skhd"
    "koekeishiya/formulae/yabai"
    "media-control"
    "asheshgoplani/tap/agent-deck"
    "ashuttl/linecast/linecast"
  ];

  casks = [
    "1password"
    "aldente"
    "android-commandlinetools"
    "bambu-studio"
    "beekeeper-studio"
    "bitwarden"
    "blender"
    "bruno"
    "discord"
    "figma"
    "firefox"
    "freecad"
    "gimp"
    "godot"
    "google-chrome"
    "halloy"
    "handbrake-app"
    "inkscape"
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
    "signal"
    "steam"
    "stremio"
    "teamspeak-client"
    "teamspeak-client@beta"
    "utm"
    "vlc"
    "wireshark-app"
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
          ", trusted: true
        ''
      ) taps)
      + (lib.concatMapStrings (
        brew:
        ''brew "''
        + brew
        + ''
          ", trusted: true
        ''
      ) brews)
      + (lib.concatMapStrings (
        cask:
        ''cask "''
        + cask
        + ''
          ", trusted: true
        ''
      ) casks);
  };
}
