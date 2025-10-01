{ inputs, pkgs, ... }:

let
  sketchybar-font = pkgs.stdenv.mkDerivation {
    name = "sketchybar-app-font";
    phases = [ "installPhase" ];
    src = inputs.sketchybar-font;
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp $src $out/share/fonts/truetype/sketchybar-app-font.ttf
    '';
  };
in
{
  home.packages = [ sketchybar-font ];
  xdg.configFile."sketchybar/icon_map.sh" = {
    source = inputs.sketchybar-icon-map;
    executable = true;
    onChange = ''
      /opt/homebrew/bin/sketchybar --reload
    '';
  };
  xdg.configFile."sketchybar/plugins" = {
    source = ./plugins;
    recursive = true;
    onChange = ''
      /opt/homebrew/bin/sketchybar --reload
    '';
  };
  xdg.configFile."sketchybar/sketchybarrc" = {
    executable = true;
    text =
      # sh
      ''
        PLUGIN_DIR="$CONFIG_DIR/plugins"

        sketchybar --bar position=top height=36 color=0x00000000

        # default=(
        #   padding_left=5
        #   padding_right=5
        #   icon.font="Symbols Nerd Font Mono:Regular:15.0"
        #   label.font="Maple Mono NF:Bold:13.0"
        #   icon.color=0xffffffff
        #   label.color=0xffffffff
        #   icon.padding_left=0
        #   icon.padding_right=6
        #   label.padding_left=0
        #   label.padding_right=0
        # )
        # sketchybar --default "''${default[@]}"
        #
        # sketchybar --add item chevron left \
        #            --set chevron icon=󰅂 label.drawing=off \
        #            --add item front_app left \
        #            --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
        #            --subscribe front_app front_app_switched
        #
        # sketchybar --add item clock right \
        #            --set clock icon=󰥔 update_freq=1 script="$PLUGIN_DIR/clock.sh" \
        #            --add item volume right \
        #            --set volume script="$PLUGIN_DIR/volume.sh" \
        #            --subscribe volume volume_change \
        #            --add item battery right \
        #            --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
        #            --subscribe battery system_woke power_source_change \
        #            --add item disk right \
        #            --set disk update_freq=120 script="$PLUGIN_DIR/disk.sh"

        default=(
          padding_left=6
          padding_right=0
          icon.font="Symbols Nerd Font Mono:Regular:15.0"
          label.font="Maple Mono NF:Bold:13.0"
          icon.color=0xff180f23
          label.color=0xff180f23
          icon.padding_left=10
          icon.padding_right=6
          label.padding_left=0
          label.padding_right=10
          background.color=0xffb3a3f1
          background.corner_radius=99
          background.height=22
        )
        sketchybar --default "''${default[@]}"

        sketchybar --add item front_app left \
                   --set front_app icon=󰅂 script="$PLUGIN_DIR/front_app.sh" \
                   --subscribe front_app front_app_switched

        sketchybar --add item clock right \
                   --set clock script="$PLUGIN_DIR/clock.sh" \
                   --add item volume right \
                   --set volume script="$PLUGIN_DIR/volume.sh" \
                   --subscribe volume volume_change \
                   --add item battery right \
                   --set battery script="$PLUGIN_DIR/battery.sh" \
                   --subscribe battery system_woke power_source_change \
                   --add item wireguard right \
                   --set wireguard script="$PLUGIN_DIR/wireguard.sh" \
                   --add item docker right \
                   --set docker script="$PLUGIN_DIR/docker.sh" \
                   --add item media right \
                   --set media script="$PLUGIN_DIR/media.sh"

                   # --add item disk right \
                   # --set disk script="$PLUGIN_DIR/disk.sh" \

        sketchybar --update
      '';
    onChange = ''
      /opt/homebrew/bin/sketchybar --reload
    '';
  };
}
