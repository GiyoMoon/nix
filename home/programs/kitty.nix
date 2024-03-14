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

      window_padding_width = 15;
      disable_ligatures = "always";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      hide_window_decorations = "titlebar-only";

      macos_quit_when_last_window_closed = "yes";
      macos_thicken_font = "0.75";
      macos_option_as_alt = "yes";

      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
    };
    extraConfig = "include current-theme.conf";
  };
}
