{ config, pkgs, lib, ... }:

with lib; {
  home.file.yabai = {
      executable = true;
      target = ".config/yabai/yabairc";
      text = ''
        #!/usr/bin/env sh

        # global settings
        yabai -m config mouse_follows_focus          off
        yabai -m config focus_follows_mouse          off
        yabai -m config window_origin_display        default
        yabai -m config window_placement             second_child

        # Requires SIP to be partially disabled
        # yabai -m config window_topmost               off
        # yabai -m config window_shadow                on
        # yabai -m config window_opacity               off
        # yabai -m config window_opacity_duration      0.0
        # yabai -m config active_window_opacity        1.0
        # yabai -m config normal_window_opacity        0.90

        yabai -m config window_border                true
        yabai -m config window_border_width          6
        yabai -m config active_window_border_color   0xffC458E7
        yabai -m config normal_window_border_color   0xff555555

        yabai -m config insert_feedback_color        0xffd75f5f
        yabai -m config split_ratio                  0.50
        yabai -m config auto_balance                 off
        yabai -m config mouse_modifier               fn
        yabai -m config mouse_action1                move
        yabai -m config mouse_action2                resize
        yabai -m config mouse_drop_action            swap

        # space settings
        yabai -m config layout                       bsp
        yabai -m config external_bar                 all:40:0
        yabai -m config bottom_padding               20
        yabai -m config left_padding                 20
        yabai -m config right_padding                20
        yabai -m config window_gap                   15

        # excluded applications
        yabai -m rule --add app="System Preferences" manage=off
        yabai -m rule --add app='Spotify' manage=off
        yabai -m rule --add app='Docker Desktop' manage=off

        echo "yabai configuration loaded.."
    '';
    onChange = ''
      /opt/homebrew/bin/brew services restart yabai
    '';
  };

  home.file.skhd = {
    executable = true;
    target = ".config/skhd/skhdrc";
    text = let
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
      ${modMask} - space : yabai -m space --balance
      # Change layout
      ${modMask} - a : yabai -m config layout bsp
      ${modMask} - d : yabai -m config layout stack
    '';
    onChange = ''
      /opt/homebrew/bin/brew services restart skhd
    '';
  };
}
