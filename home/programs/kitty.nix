{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # Workaround to use homebrew package
    package = pkgs.runCommand "kitty" { } ''
      mkdir -p $out/bin
      ln -s /opt/homebrew/bin/kitty $out/bin/kitty
    '';
    darwinLaunchOptions =
      [ "--single-instance" "--directory=~" "--listen-on=unix:/tmp/kitty" ];
    font = {
      name = "FiraCode Nerd Font";
      size = 18;
    };
    keybindings = {
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+l" = "next_tab";
    };
    settings = {
      kitty_mod = "shift+cmd";
      macos_quit_when_last_window_closed = "yes";
      window_padding_width = 15;
      # background_opacity = "0.75";
      disable_ligatures = "always";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
      macos_thicken_font = "0.75";
      hide_window_decorations = "titlebar-only";
    };
    extraConfig = "include current-theme.conf";
  };
}
