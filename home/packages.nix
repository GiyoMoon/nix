{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  programs.bat.enable = true;
  programs.eza.enable = true;

  home.packages = with pkgs; [
    pinentry_mac
    gnupg

    # cli
    wget
    fd
    ripgrep
    hadolint
    gitmoji-cli
    yt-dlp

    # fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    monaspace

    # javascript
    nodejs_20
    nodePackages.pnpm
    nodePackages.yarn
    bun

    rustup
    sqlx-cli

    # mobile development
    # Installing over brew until 1.15.2 is out on nixpkgs
    # cocoapods

    # php stuff :(
    (php83.buildEnv {
      extraConfig = ''
        memory_limit = 2G
        extension = ${php83Extensions.imagick}/lib/php/extensions/imagick.so
      '';
    })
    php83Packages.composer
    php83Extensions.imagick
  ];
}
