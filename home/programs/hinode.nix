{ config, pkgs, ... }:

{
  launchd = {
    enable = true;
    agents = {
      hinode = {
        enable = true;
        config = {
          ProgramArguments = [
            "${pkgs.hinode}/bin/hinode"
            "--latitude"
            "46.9480"
            "--longitude"
            "7.4474"
            "--light-mode-cmd"
            "/Users/jasi/.nix-profile/bin/fish -c 'st light'"
            "--dark-mode-cmd"
            "/Users/jasi/.nix-profile/bin/fish -c 'st dark'"
            "--debug"
          ];
          KeepAlive = true;
          RunAtLoad = true;
          ProcessType = "Standard";
          StandardOutPath =
            "${config.home.homeDirectory}/Library/Logs/hinode/stdout";
          StandardErrorPath =
            "${config.home.homeDirectory}/Library/Logs/hinode/stderr";
        };
      };
    };
  };
}
