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
        rev = "d8fe92c744dea18a8636497aca075bed9a4bc5cd";
        sha256 = "sha256-EbM0M3+mr5WjUfbeN53awKi659JQZqDiPHmOytv2PcY=";
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

    hinode
  ];
}
