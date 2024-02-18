{ lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;
      add_newline = false;
      format = lib.concatStrings [
        "$directory"

        "$git_branch"
        "$git_status"

        "$c"
        "$dart"
        "$elixir"
        "$elm"
        "$golang"
        "$haskell"
        "$java"
        "$nodejs"
        "$php"
        "$rust"

        "$package"
        "$cmd_duration"

        "$line_break"
        "$character"
      ];

      directory = {
        style = "fg:#d774f8";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙";
          "Downloads" = "";
        };
        read_only = " ";
      };

      git_branch = {
        format = "[$symbol $branch](fg:#9f62f6)";
        symbol = "";
      };
      git_status = { format = "[$all_status$ahead_behind](fg:#9f62f6) "; };

      c = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      dart = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      elixir = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      elm = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      golang = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      haskell = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      java = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      nodejs = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      php = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };
      rust = {
        format = "[$symbol ($version)](fg:#eb568c) ";
        symbol = "";
      };

      package = {
        format = "[$symbol ($version)](fg:#54a7f8) ";
        symbol = "";
      };

      cmd_duration = { format = "[ $duration](fg:#d774f8)"; };

      character = {
        success_symbol = "[❯](fg:#9f62f6)";
        error_symbol = "[❯](fg:#eb568c)";
      };

      nix_shell.symbol = "";
      docker_context.symbol = "";
    };
  };
}
