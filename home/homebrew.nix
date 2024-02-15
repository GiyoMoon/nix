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
  ];

  casks = [
    "1password"
    "aldente"
    # "android-commandlinetools"
    # "android-file-transfer"
    "arc"
    # "beekeeper-studio"
    # "bruno"
    # "chromium"
    # "discord"
    # "docker"
    # "firefox-developer-edition"
    # "gimp"
    # "handbrake"
    "kitty"
    # "licecap"
    # "mullvadvpn"
    # "obsidian"
    # "parsec"
    # "pika"
    # "qbittorrent"
    "raycast"
    # "stremio"
    # "temurin17"
    "ubersicht"
    # "vlc"
    "vscodium"
  ];

  mas = [
  #   {
  #   name = "WireGuard";
  #   id = "1451685025";
  # }
  ];
in {
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".Brewfile" = {
    text = (lib.concatMapStrings (tap:
      ''tap "'' + tap + ''
        "
      '') taps) + (lib.concatMapStrings (brew:
        ''brew "'' + brew + ''
          "
        '') brews) + (lib.concatMapStrings (cask:
          ''cask "'' + cask + ''
            "
          '') casks) + (lib.concatMapStrings
            ({ name, id }: ''mas "'' + name + ''", id: '' + id + "\n") mas);
  };
}
