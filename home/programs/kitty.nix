{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # Workaround to use homebrew package
    package = pkgs.runCommand "kitty" { } ''
      mkdir -p $out/bin
      ln -s /opt/homebrew/bin/kitty $out/bin/kitty
    '';
    font = {
      name = "FiraCode Nerd Font";
      size = 18;
    };
    settings = {
      macos_quit_when_last_window_closed = "yes";
      window_padding_width = 15;
      # background_opacity = "0.75";
    };
    extraConfig = "include current-theme.conf";
  };
}
