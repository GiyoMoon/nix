{ lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = "$battery$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$python$character";
    };
  };
}