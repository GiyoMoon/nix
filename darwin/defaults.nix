{ lib, ... }:

let
  inherit (lib) concatStringsSep;
  postActivationCmds = [
    # Disable startup sound
    "sudo nvram StartupMute=%01"

    # Power settings
    # -a: All Power modes
    # -c: A/C Power
    # -b: Battery Power
    "sudo pmset -a displaysleep 15"
  ];
  postUserActivationCmds = [
    # clear dock apps
    "defaults write com.apple.dock persistent-apps -array"

    # Bluetooth - Increase sound quality for headphones/headsets
    "defaults write com.apple.BluetoothAudioAgent \"Apple Bitpool Min (editable)\" -int 40"

    # Disable user interface sound effects
    "defaults write \"Apple Global Domain\" com.apple.sound.uiaudio.enabled -int 0"
    "osascript -e 'tell application \"Finder\" to set volume alert volume 0'"
  ];
in
{
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "bottom";
      autohide-delay = 0.0;
      show-recents = false;
      tilesize = 42;
      minimize-to-application = true;
      launchanim = false;
      mineffect = "scale";
      mru-spaces = false;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      autohide-time-modifier = 0.2;
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      QuitMenuItem = true;
    };

    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };

    NSGlobalDomain = {
      _HIHideMenuBar = true;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      AppleFontSmoothing = 1;
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 3;
      "com.apple.swipescrolldirection" = false;
      "com.apple.keyboard.fnState" = true;
    };

    smb.NetBIOSName = "MacBook Jasi";

    screencapture.disable-shadow = true;

    trackpad = {
      Clicking = true;
      FirstClickThreshold = 0;
      SecondClickThreshold = 0;
    };

    LaunchServices.LSQuarantine = false;
  };

  system.activationScripts.postActivation.text = concatStringsSep "\n" postActivationCmds;
  system.activationScripts.postUserActivation.text = concatStringsSep "\n" postUserActivationCmds;
}
