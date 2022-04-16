{ ... }:

{
  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';

  programs.zsh.enable = true;

  services.nix-daemon.enable = true;

  environment = {
    shellAliases = {
      c = "clear";
    };
  };

  time.timeZone = "Europe/Zurich";

  networking = {
    computerName = "MacBook Jasi";
    hostName = "MacBook-Jasi";
    localHostName = "MacBook-Jasi";
  };

  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
   ];
}