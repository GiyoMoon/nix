{ config, pkgs, lib, ... }:

with lib; {
  home = {
    username = "jasi";
    homeDirectory = "/Users/jasi";

    # Release notes: https://nix-community.github.io/home-manager/release-notes.xhtml
    stateVersion = "24.05";

    sessionVariables = { TERM = "xterm-256color"; };
  };

  programs.home-manager.enable = true;

  imports = [
    ./macos.nix
    ./packages.nix
    ./homebrew.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/shell.nix
    ./programs/starship.nix
    ./programs/yabai.nix
  ];

  home.activation = {
    homebrew = ''
      run /opt/homebrew/bin/brew bundle install --force --no-lock --global --cleanup --zap
      run /opt/homebrew/bin/yabai --start-service
      run /opt/homebrew/bin/skhd --start-service
    '';
    disableStartupSound = ''
      run /usr/bin/sudo /usr/sbin/nvram StartupMute=%01
    '';
    sleepSetting = ''
      run /usr/bin/sudo /usr/bin/pmset -a displaysleep 15
    '';
    disableInterfaceSounds = ''
      run /usr/bin/defaults write com.apple.sound.uiaudio.enabled -bool false
    '';
  };
}