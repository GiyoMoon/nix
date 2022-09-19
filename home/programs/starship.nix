{ lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "[](#FE9ACE)"
        "$directory"
        "[](fg:#FE9ACE bg:#FF53BF)"
        "$git_branch"
        "$git_status"
        "[](fg:#FF53BF bg:#000000)"
        "[](fg:#000000 bg:#6760FE)"
        "$c"
        "$elixir"
        "$elm"
        "$golang"
        "$haskell"
        "$java"
        "$julia"
        "$nodejs"
        "$nim"
        "$rust"
        "[](fg:#6760FE bg:#8EA6FF)"
        "$package"
        "[](fg:#8EA6FF)"
        "$line_break"
        "$character"
      ];

      directory = {
        style = "bg:#FE9ACE";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = " ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      package = {
        style = "bg:#8EA6FF";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        style = "bg:#FF53BF";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#FF53BF";
        format = "[$all_status$ahead_behind ]($style)";
      };

      c = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      elixir = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      elm = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      golang = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      haskell = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      java = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      julia = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      nodejs = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      nim = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };
      rust = {
        style = "bg:#6760FE";
        format = "[ $symbol ($version) ]($style)";
      };

      character = {
        success_symbol = "[](fg:#6760FE)";
        error_symbol = "[](fg:#FF53BF)";
      };
    };
  };
}
