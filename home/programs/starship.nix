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
        style = "none";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙";
          "Downloads" = "";
        };
        read_only = " ";
      };

      git_branch = {
        format = "[$symbol $branch](fg:purple)";
        symbol = "";
      };
      git_status = {
        format = "[$all_status$ahead_behind](fg:red) ";
      };

      c = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      dart = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      elixir = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      elm = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      golang = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      haskell = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      java = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      nodejs = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      php = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      rust = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };

      package = {
        format = "[$symbol ($version)](fg:red) ";
        symbol = "";
      };

      cmd_duration = {
        format = "[ $duration](fg:yellow)";
      };

      character = {
        success_symbol = "❯";
        error_symbol = "[❯](fg:red)";
      };
    };
  };
}
