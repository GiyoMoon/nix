{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    ignores = [ ".DS_Store" ];

    userName = "GiyoMoon";
    userEmail = "giyomoon@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };

    includes = [
      {
        condition = "gitdir:~/Documents/dev/work/";
        contents = {
          user.name = "Jasmin Nötzli";
          user.email = "jasmin.noetzli@blinkdrive.ch";
          user.signingKey = "379CAA1A6BBA8F7829E79FD9F077A56961503993";
        };
      }
    ];

    signing = {
      key = "7F35C1EA94675E53CD5570CA5059E9821D1E1158";
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
