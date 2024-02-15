{ lib, ... }:

{
  targets.darwin.defaults = {
    "com.apple.dock" = {
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
      static-only = true;
    };

    "com.apple.finder" = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      QuitMenuItem = true;
    };

    "com.apple.loginwindow" = {
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
    };

    "com.apple.AppleMultitouchTrackpad" = {
      Clicking = true;
      FirstClickThreshold = 0;
      SecondClickThreshold = 0;
    };

    "com.apple" = {
      swipescrolldirection = false;
    };
    "com.apple.keyboard" = { fnState = true; };
    "com.apple.screencapture" = { disable-shadow = true; };
    "com.apple.LaunchServices" = { LSQuarantine = false; };
    "com.apple.BluetoothAudioAgent" = { "Apple Bitpool Min (editable)" = 40; };
  };
}
