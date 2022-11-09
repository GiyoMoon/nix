{ pkgs, ... }:

let
  yabai = pkgs.yabai.overrideAttrs (old: rec {
    version = "5.0.1";
    src = builtins.fetchTarball {
      url = https://github.com/koekeishiya/yabai/releases/download/v5.0.1/yabai-v5.0.1.tar.gz;
      sha256 = "03kkjgq1kdaic7hbqhlgmr6vcvcdpsyivdh87492sgp5l71i0hvl";
    };
  });
in
{
  services.yabai = {
      enable = true;
      # Requires disabling SIP
      # enableScriptingAddition = true;
      package = yabai;
      config = {
        focus_follows_mouse = "off";
        mouse_follows_focus = "off";
        # Somehow doesn't work...
        # mouse_modifier = "fn";
        # mouse_action1 = "move";
        # mouse_action2 = "resize";
        layout = "bsp";
        split_ratio = 0.5;
        top_padding = 20;
        bottom_padding = 20;
        left_padding = 20;
        right_padding = 20;
        window_gap = 5;
      };
      extraConfig = ''
        yabai -m rule --add app='System Preferences' manage=off
        yabai -m rule --add app='Spotify' manage=off
      '';
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = let
      modMask = "shift + alt";
      moveMask = "ctrl + shift + alt";
    in ''
      # focus window
      ${modMask} - h : yabai -m window --focus west
      ${modMask} - j : yabai -m window --focus south
      ${modMask} - k : yabai -m window --focus north
      ${modMask} - l : yabai -m window --focus east
      # swap managed window
      ${moveMask} - h : yabai -m window --swap west
      ${moveMask} - j : yabai -m window --swap south
      ${moveMask} - k : yabai -m window --swap north
      ${moveMask} - l : yabai -m window --swap east
      # balance size of windows
      # ${modMask} - d : yabai -m space --balance
      # Change layout
      ${modMask} - a : yabai -m config layout bsp
      ${modMask} - d : yabai -m config layout stack
    '';
  };
}
