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
    "handbrake"
    "mac-cleanup-py"
  ];

  casks = [
    "1password"
    "aldente"
    "android-commandlinetools"
    "arc"
    "autodesk-fusion"
    "bambu-studio"
    "beekeeper-studio"
    "bruno"
    "discord"
    "firefox"
    "gimp"
    "google-chrome"
    "handbrake"
    "kitty"
    "licecap"
    "obsidian"
    "orbstack"
    "orcaslicer"
    "parsec"
    "pika"
    "prismlauncher"
    "raycast"
    "steam"
    "stremio"
    "ubersicht"
    "utm"
    "vlc"
    "zen-browser"
    "qbittorrent"
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
