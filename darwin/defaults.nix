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

    # Always show sound settings in menubar 
    # Somehow doesn't work :sadge:
    # "defaults write \"com.apple.controlcenter\" \"NSStatusItem Visible Sound\" -int 1"

    # Put Amethyst into login items
    "osascript -e 'tell application \"System Events\" to make login item at end with properties { path:\"/Applications/Amethyst.app\", hidden: false }'"

    # Remove spotlight shortcut
    # Doesn't work as xmlstarlet isn't available in activationScripts :(
    # "plutil -convert xml1 -o - ~/Library/Preferences/com.apple.symbolichotkeys.plist | xmlstarlet ed --rename '/plist/dict/key[text()=\"AppleSymbolicHotKeys\"]/following-sibling::dict[1]/key[text()=\"64\"]/following-sibling::dict[1]/true' --value 'false' | sed -e '1,5d;$d;$d' | xargs | sed 's/^/\'/;s/$/\'/' | xargs defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys"

    # Set fish as the default shell
    "chsh -s /run/current-system/sw/bin/fish"
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