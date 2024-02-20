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
  };
}
