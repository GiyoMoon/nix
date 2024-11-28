{ inputs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global = {
      load_dotenv = true;
    };
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "puffer-fish";
        src = inputs.puffer-fish;
      }
    ];

    shellInit = ''
      # Remove last login message. See: https://stackoverflow.com/a/69915614
      printf '\33c\e[3J'

      # Disable fish greeting
      set -g fish_greeting ""
      set -Ux ANDROID_HOME /opt/homebrew/share/android-commandlinetools

      # bin paths
      fish_add_path $HOME/.nix-profile/bin
      fish_add_path /nix/var/nix/profiles/default/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /opt/homebrew/share/android-commandlinetools/platform-tools
      fish_add_path /opt/homebrew/share/android-commandlinetools/emulator
      fish_add_path $HOME/.cargo/bin
      fish_add_path $HOME/.config/composer/vendor/bin
    '';

    shellAliases = {
      c = "clear";
      f = "z";
      ls = "eza";
      cat = "bat";
      find = "fd";
      du = "dust";

      p = "pnpm";
      pex = "pnpm exec";
      plx = "pnpm dlx";

      v = "nvim";

      flutter = "fvm flutter";
      dart = "fvm dart";

      pa = "php artisan";

      k = "kubectl";
    };

    functions = {
      st = {
        argumentNames = "mode";
        description = "switches global theme";
        body = # fish
          ''
            if [ "$mode" = "light" ]
              osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" > /dev/null
              st_kitty "Rosé Pine Dawn"
              # st_kitty "Everforest Light Medium"
              set nvims "$TMPDIR"nvim."$USER"/*/nvim.*.0
              if count $nvims >/dev/null
                for i in (ls $nvims)
                  nvim --server $i --remote-send ':LightTheme<CR>'
                end
              end
              echo "Switched to Light Theme"
            else if [ "$mode" = "dark" ]
              osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" > /dev/null
              # st_kitty "Tokyo Night Moon"
              # st_kitty "Everforest Dark Medium"
              # st_kitty "Eldritch"
              st_kitty "Rosé Pine"
              set nvims "$TMPDIR"nvim."$USER"/*/nvim.*.0
              if count $nvims >/dev/null
                for i in (ls $nvims)
                  nvim --server $i --remote-send ':DarkTheme<CR>'
                end
              end
              echo "Switched to Dark Theme"
            else
              if [ (os_mode) = "dark" ]
                st "light"
              else
                st "dark"
              end
            end
          '';
      };
      st_kitty = {
        argumentNames = "theme_name";
        description = "changes the kitty terminal theme";
        body = # fish
          ''
            if [ -z "$theme_name" ]
              echo "Please pass a theme as argument"
              return
            end

            set -l current_theme (realpath ~/.config/kitty/current-theme.conf)

            if kitty +kitten themes --dump-theme $theme_name > $current_theme
              kitty @ --to unix:/tmp/kitty set-colors -a -c $current_theme
            else
              echo "Theme not found"
            end
          '';
      };
      os_mode = {
        description = "get the current appearance mode of the system";
        body = # fish
          ''
            if [ (defaults read -g AppleInterfaceStyle 2> /dev/null) ]
              echo "dark"
            else
              echo "light"
            end
          '';
      };
      ns = {
        description = "nix shell shortcut";
        body = # fish
          ''
            if test (count $argv) -eq 0
                echo "Error: Please provide at least one package name"
                return 1
            end

            set nix_shell_cmd "nix shell"

            for pkg in $argv
                set nix_shell_cmd "$nix_shell_cmd nixpkgs#$pkg"
            end

            eval $nix_shell_cmd
          '';
      };
    };
  };
}
