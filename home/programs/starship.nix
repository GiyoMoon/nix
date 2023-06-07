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
      };

      git_branch = {
        format = "[$symbol $branch](fg:#FFC8DD)";
      };
      git_status = {
        format = "[$all_status$ahead_behind](fg:#FFC8DD) ";
      };

      c = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      dart = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      elixir = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      elm = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      golang = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      haskell = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      java = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      nodejs = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      php = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };
      rust = {
        format = "[$symbol ($version)](fg:#FFAFCC) ";
      };

      package = {
        format = "[$symbol ($version)](fg:#BDE0FE) ";
      };

      cmd_duration = {
        format = " [$duration](fg:#A2D2FF)";
      };

      character = {
        success_symbol = "[❯](fg:#C59DFF)";
        error_symbol = "[❯](fg:#FF53BF)";
      };
    };
  };
}
