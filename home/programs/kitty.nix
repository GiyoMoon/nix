{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # Workaround to use homebrew package
    package = pkgs.writeShellScriptBin "_kitty" "kitty";
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    settings = {
      hide_window_decorations = "titlebar-only";
      macos_quit_when_last_window_closed = "yes";
      window_padding_width = 20;
      background_opacity = "0.85";
    };
  };
}