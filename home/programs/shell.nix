{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global = { load_dotenv = true; };
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

    plugins = [{
      name = "puffer-fish";
      src = pkgs.fetchFromGitHub {
        owner = "nickeb96";
        repo = "puffer-fish";
        rev = "5d3cb25e0d63356c3342fb3101810799bb651b64";
        sha256 = "sha256-aPxEHSXfiJJXosIm7b3Pd+yFnyz43W3GXyUB5BFAF54=";
      };
    }];

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
      gm = "gitmoji";

      code = "codium";
      "c." = "code .";

      p = "pnpm";
      pex = "pnpm exec";
      plx = "pnpm dlx";

      v = "nvim";
      "v." = "nvim .";

      flutter = "fvm flutter";
      dart = "fvm dart";

      pa = "php artisan";
    };

    functions = {
      st = {
        argumentNames = "mode";
        description = "switches global theme";
        body = ''
          if [ "$mode" = "dark" ]
            osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"
            st_kitty "Catppuccin-Macchiato"
            echo "Switched to Dark Theme"
          else if [ "$mode" = "light" ]
            osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false"
            st_kitty "Catppuccin-Latte"
            echo "Switched to Light Theme"
          else
            if [ (os_dark_mode) = "true" ]
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
        body = ''
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
      os_dark_mode = {
        description = "checks if macOS dark mode is on";
        body = ''
          osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode()"'';
      };
    };
  };
}
