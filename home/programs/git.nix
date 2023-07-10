{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    ignores = [ ".DS_Store" ];

    userName = "Jasmin";
    userEmail = "code@jasi.dev";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };

    includes = [
      {
        condition = "gitdir:~/Documents/dev/work/";
        contents = {
          user.name = "Jasmin";
          user.email = "blink@jasi.dev";
          user.signingKey = "6BCBF2FCCE79B9919B1B4AA39F3D123478A32800";
        };
      }
    ];

    signing = {
      key = "65DF56C115CD06841E6609D78A5E05D8D7724765";
      signByDefault = true;
    };

    aliases = {
      pl = "pull";
      pu = "push";

      co = "checkout";
      cob = "checkout -b";

      rb = "rebase";
      rba = "rebase --abort";
      rbc = "rebase --continue";

      st = "stash";
      spo = "stash pop";

      r = "reset --soft HEAD~1";

      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) - %C(green)(%ar)%C(reset) %s %C(italic)- %an%C(reset)%C(magenta bold)%d%C(reset)' --all";
    };
  };
}
