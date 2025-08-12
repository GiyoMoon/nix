{ lib, ... }:

let
  taps = [
    "homebrew/cask-versions"
    "homebrew/services"
    # yabai and skhd
    "koekeishiya/formulae"
    "mac-cleanup/mac-cleanup-py"
  ];

  brews = [
    "skhd"
    "yabai"
    "mac-cleanup-py"
    "monero"
  ];

  casks = [
    "1password"
    "aldente"
    "android-commandlinetools"
    "bambu-studio"
    "beekeeper-studio"
    "bruno"
    "discord"
    "firefox"
    "freecad"
    "ghidra"
    "gimp"
    "google-chrome"
    "handbrake-app"
    "kitty"
    "licecap"
    "monero-wallet"
    "obsidian"
    "openscad"
    "orbstack"
    "orcaslicer"
    "parsec"
    "pika"
    "prismlauncher"
    "qbittorrent"
    "raycast"
    "steam"
    "stremio"
    "teamspeak-client"
    "teamspeak-client@beta"
    "ubersicht"
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
