{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "puffer-fish";
        src = pkgs.fetchFromGitHub {
          owner = "nickeb96";
          repo = "puffer-fish";
          rev = "fd0a9c95da59512beffddb3df95e64221f894631";
          sha256 = "sha256-TdGyrAlL7aMxNtemxzOwTaOI+bbQ4zML2N2tV300FM8=";
        };
      }
    ];

    shellAliases = {
      c = "clear";
      code = "codium";
      "c." = "code .";
      ls = "eza";
      cat = "bat";
      vim = "nvim";
      v = "vim";
      "v." = "vim .";
      dev = "cd ~/Documents/dev";
      work = "cd ~/Documents/dev/work";
      priv = "cd ~/Documents/dev/priv";
      flutter = "fvm flutter";
      dart = "fvm dart";
      pa = "php artisan";
      gm = "npx gitmoji-cli";
    };

    shellInit = ''
      fish_add_path ~/.cargo/bin /opt/homebrew/bin ~/.deno/bin ~/.config/composer/vendor/bin /opt/homebrew/share/android-commandlinetools/platform-tools /opt/homebrew/share/android-commandlinetools/emulator
      set -Ux ANDROID_HOME /opt/homebrew/share/android-commandlinetools
      # Disable fish greeting
      set -g fish_greeting ""

      # Set fish syntax highlighting
      set -g fish_color_autosuggestion '555'  'brblack'
      set -g fish_color_cancel -r
      set -g fish_color_command --bold
      set -g fish_color_comment red
      set -g fish_color_cwd green
      set -g fish_color_cwd_root red
      set -g fish_color_end brmagenta
      set -g fish_color_error brred
      set -g fish_color_escape 'bryellow'  '--bold'
      set -g fish_color_history_current --bold
      set -g fish_color_host normal
      set -g fish_color_match --background=brblue
      set -g fish_color_normal normal
      set -g fish_color_operator bryellow
      set -g fish_color_param cyan
      set -g fish_color_quote yellow
      set -g fish_color_redirection brblue
      set -g fish_color_search_match 'bryellow'  '--background=brblack'
      set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
      set -g fish_color_user brgreen
      set -g fish_color_valid_path --underline

      thefuck --alias | source
      direnv hook fish | source
      atuin init fish | source
    '';
  };
}
