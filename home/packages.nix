{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  programs.bat.enable = true;
  programs.eza.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      hinode = pkgs.callPackage "${pkgs.fetchFromGitHub {
        owner = "GiyoMoon";
        repo = "hinode";
        rev = "a15255357472fc19ba6b2a5272ec136e659d3e3c";
        sha256 = "sha256-rbFwQn52aoIUWhx+zyiJRqcdNRGaDowblpk/DCqHXUs=";
      }}" { };
    })
  ];

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
    cloudflared
    hinode

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
