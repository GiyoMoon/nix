{ pkgs, ... }:

{
  home.sessionVariables = {
    TERM = "xterm-256color";
  };

  programs.kitty = {
    enable = true;
    # Workaround to use homebrew package
    package = pkgs.runCommand "kitty" { } ''
        mkdir -p $out/bin
        ln -s /opt/homebrew/bin/kitty $out/bin/kitty
      '';
    font = {
      name = "FiraCode Nerd Font";
      size = 16;
    };
    settings = {
      macos_quit_when_last_window_closed = "yes";
      window_padding_width = 20;
      background_opacity = "0.85";
    };
  };
}
