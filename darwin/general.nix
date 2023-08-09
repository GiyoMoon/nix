{ pkgs, ... }:

{
  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';

  programs.fish.enable = true;

  services.nix-daemon.enable = true;

  environment = {
    shellAliases = {
      c = "clear";
      code = "codium";
      "c." = "code .";
      ls = "exa";
      cat = "bat";
      p = "pnpm";
      vim = "nvim";
      v = "vim";
      "v." = "vim .";
      dev = "cd ~/Documents/dev";
      work = "cd ~/Documents/dev/work";
      priv = "cd ~/Documents/dev/priv";
      flutter = "fvm flutter";
      dart = "fvm dart";
    };
    shells = [
      pkgs.fish
    ];
  };

  users.users.giyomoon.home = "/Users/giyomoon";

  time.timeZone = "Europe/Zurich";

  networking = {
    computerName = "MacBook-Jasi";
    hostName = "MacBook-Jasi";
    localHostName = "MacBook-Jasi";
  };

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "FiraCode" ]; })
   ];
}
