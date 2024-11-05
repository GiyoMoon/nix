{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # Workaround to use homebrew package
    package = pkgs.runCommand "kitty" { } ''
      mkdir -p $out/bin
      ln -s /opt/homebrew/bin/kitty $out/bin/kitty
    '';
    darwinLaunchOptions = [
      "--single-instance"
      "--directory=~"
      "--listen-on=unix:/tmp/kitty"
    ];
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      # name = "GeistMono Nerd Font Mono";
      size = 18;
    };
    keybindings = {
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+j" = "next_window";
      "kitty_mod+k" = "previous_window";
      "kitty_mod+l" = "next_tab";
      "kitty_mod+p" = "next_layout";
    };
    settings = {
      kitty_mod = "shift+cmd";
      enabled_layouts = "horizontal,vertical";

      window_padding_width = 15;
      disable_ligatures = "always";

      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      hide_window_decorations = "titlebar-only";

      macos_quit_when_last_window_closed = "yes";
      macos_thicken_font = "0.50";

      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
      cursor_trail = 1;
      cursor_trail_decay = "0.01 0.09";
    };
    extraConfig = "include current-theme.conf";
  };
}
