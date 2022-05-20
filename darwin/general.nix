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
      "c." = "code .";
      ls = "exa";
      cat = "bat";
      p = "pnpm";
    };
    shells = [
      pkgs.fish
    ];
  };

  time.timeZone = "Europe/Zurich";

  networking = {
    computerName = "MacBook Jasi";
    hostName = "MacBook-Jasi";
    localHostName = "MacBook-Jasi";
  };

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "FiraCode" ]; })
   ];
}