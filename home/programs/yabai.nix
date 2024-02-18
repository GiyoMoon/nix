{ ... }:

{
  home.file.yabai = {
    executable = true;
    target = ".config/yabai/yabairc";
    text = ''
      #!/usr/bin/env sh

      # global settings
      /opt/homebrew/bin/yabai -m config mouse_follows_focus          off
      /opt/homebrew/bin/yabai -m config focus_follows_mouse          off
      /opt/homebrew/bin/yabai -m config window_origin_display        default
      /opt/homebrew/bin/yabai -m config window_placement             second_child

      # Requires SIP to be partially disabled
      # /opt/homebrew/bin/yabai -m config window_topmost               off
      # /opt/homebrew/bin/yabai -m config window_shadow                on
      # /opt/homebrew/bin/yabai -m config window_opacity               off
      # /opt/homebrew/bin/yabai -m config window_opacity_duration      0.0
      # /opt/homebrew/bin/yabai -m config active_window_opacity        1.0
      # /opt/homebrew/bin/yabai -m config normal_window_opacity        0.90

      /opt/homebrew/bin/yabai -m config window_border                true
      /opt/homebrew/bin/yabai -m config window_border_width          6
      /opt/homebrew/bin/yabai -m config active_window_border_color   0xffC458E7
      /opt/homebrew/bin/yabai -m config normal_window_border_color   0xff555555

      /opt/homebrew/bin/yabai -m config insert_feedback_color        0xffd75f5f
      /opt/homebrew/bin/yabai -m config split_ratio                  0.50
      /opt/homebrew/bin/yabai -m config auto_balance                 off
      /opt/homebrew/bin/yabai -m config mouse_modifier               fn
      /opt/homebrew/bin/yabai -m config mouse_action1                move
      /opt/homebrew/bin/yabai -m config mouse_action2                resize
      /opt/homebrew/bin/yabai -m config mouse_drop_action            swap

      # space settings
      /opt/homebrew/bin/yabai -m config layout                       stack
      /opt/homebrew/bin/yabai -m config external_bar                 all:40:0
      /opt/homebrew/bin/yabai -m config bottom_padding               20
      /opt/homebrew/bin/yabai -m config left_padding                 20
      /opt/homebrew/bin/yabai -m config right_padding                20
      /opt/homebrew/bin/yabai -m config window_gap                   15

      # excluded applications
      /opt/homebrew/bin/yabai -m rule --add app="System Settings" manage=off
      /opt/homebrew/bin/yabai -m rule --add app="Docker Desktop" manage=off
      # /opt/homebrew/bin/yabai -m rule --add app="Godot" manage=off
      # /opt/homebrew/bin/yabai -m rule --add app="GIMP" title!='(^GNU|^GIMP)' manage=off
      /opt/homebrew/bin/yabai -m rule --add title="^Android Emulator*" manage=off
      /opt/homebrew/bin/yabai -m rule --add app="Simulator" manage=off
      /opt/homebrew/bin/yabai -m rule --add app="Bruno" manage=off
      /opt/homebrew/bin/yabai -m rule --add app="1Password" manage=off

      echo "yabai configuration loaded.."
    '';
    onChange = ''
      /opt/homebrew/bin/yabai --restart-service
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
      /opt/homebrew/bin/skhd --restart-service
    '';
  };
}
