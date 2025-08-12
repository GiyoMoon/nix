{ ... }:

{
  home = {
    username = "jasi";
    homeDirectory = "/Users/jasi";

    # Release notes: https://nix-community.github.io/home-manager/release-notes.xhtml
    stateVersion = "25.05";

    sessionVariables = {
      TERM = "xterm-256color";
      SOPS_AGE_KEY_FILE = "$HOME/.config/sops/age/keys.txt";
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ./macos.nix
    ./packages.nix
    ./homebrew.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/nixvim
    ./programs/shell.nix
    ./programs/simple-bar.nix
    ./programs/starship.nix
    ./programs/yabai.nix
  ];

  home.activation = {
    homebrew = ''
      run /opt/homebrew/bin/brew bundle install --force --global --cleanup --zap
    '';
    # TODO: Find a way to only run this on first activation
    # disableStartupSound = ''
    #   run /usr/bin/sudo /usr/sbin/nvram StartupMute=%01
    # '';
    # sleepSetting = ''
    #   run /usr/bin/sudo /usr/bin/pmset -a displaysleep 15
    # '';
    disableInterfaceSounds = ''
      run /usr/bin/defaults write com.apple.sound.uiaudio.enabled -bool false
    '';
    dsDontWriteNetworkStores = ''
      run /usr/bin/defaults write com.apple.desktopservices DSDontWriteNetworkStores true
      run /usr/bin/defaults write com.apple.desktopservices DSDontWriteUSBStores true
    '';
  };
}
