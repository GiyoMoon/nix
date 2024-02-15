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
        style = "fg:#C59DFF";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙";
          "Downloads" = "";
        };
        read_only = " ";
      };

      git_branch = {
        format = "[$symbol $branch](fg:#FFC8DD)";
        symbol = "";
      };
      git_status = { format = "[$all_status$ahead_behind](fg:#FFC8DD) "; };

      c = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      dart = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      elixir = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      elm = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      golang = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      haskell = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      java = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      nodejs = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      php = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };
      rust = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
        symbol = "";
      };

      package = {
        format = "[$symbol ($version)](fg:#BDE0FE) ";
        symbol = "";
      };

      cmd_duration = { format = " [$duration](fg:#A2D2FF)"; };

      character = {
        success_symbol = "[❯](fg:#C59DFF)";
        error_symbol = "[❯](fg:#FF53BF)";
      };

      nix_shell.symbol = "";
      docker_context.symbol = "";
    };
  };
}
