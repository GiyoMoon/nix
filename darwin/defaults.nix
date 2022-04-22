{ lib, ... }:

let
  inherit (lib) concatStringsSep;
  postActivationCmds = [
    # Disable startup sound
    "sudo nvram StartupMute=%01"
  ];
  postUserActivationCmds = [
    # clear dock apps
    "defaults write com.apple.dock persistent-apps -array"

    # Put Amethyst into login items
    "osascript -e 'tell application \"System Events\" to make login item at end with properties { path:\"/Applications/Amethyst.app\", hidden: false }'"
  ];
in
{
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "bottom";
      autohide-delay = "0.0";
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
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
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
      "com.apple.swipescrolldirection" = false;
      "com.apple.keyboard.fnState" = true;
    };

    smb.NetBIOSName = "MacBook Jasi";

    screencapture.disable-shadow = true;

    trackpad.Clicking = true;

    LaunchServices.LSQuarantine = false;
  };

  system.activationScripts.postActivation.text = concatStringsSep "\n" postActivationCmds;
  system.activationScripts.postUserActivation.text = concatStringsSep "\n" postUserActivationCmds;
}