{ ... }:

{
  programs.git = {
    enable = true;

    ignores = [ ".DS_Store" ];

    settings = {
      user = {
        name = "Jasmin";
        email = "code@jasi.dev";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
      alias = {
        c = "commit";

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

        pra = "pull --rebase --autostash";
      };
    };

    includes = [
      {
        condition = "gitdir:~/Documents/work/";
        contents = {
          user = {
            name = "Jasmin";
            email = "blink@jasi.dev";
            signingKey = "6BCBF2FCCE79B9919B1B4AA39F3D123478A32800";
          };
        };
      }
    ];

    signing = {
      key = "65DF56C115CD06841E6609D78A5E05D8D7724765";
      signByDefault = true;
    };
  };
}
