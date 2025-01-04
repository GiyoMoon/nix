{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  programs.bat.enable = true;
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" ];
  };

  home.packages = with pkgs; [
    pinentry_mac
    gnupg

    # cli
    cloudflared
    fd
    gnused
    (writeShellScriptBin "gsed" "exec ${gnused}/bin/sed \"$@\"")
    hadolint
    hyperfine
    ripgrep
    wget
    yt-dlp
    ollama
    jq
    lima
    xz
    fastlane
    coreutils
    kubectl
    rcon
    mgitstatus
    dust
    gh

    nerd-fonts.fira-code
    nerd-fonts.agave
    nerd-fonts.monaspace
    nerd-fonts.caskaydia-cove
    nerd-fonts.geist-mono

    # javascript
    nodejs_22
    pnpm
    nodePackages.yarn
    bun

    rustup
    sqlx-cli

    # mobile development
    cocoapods
    temurin-bin-17

    # formatters
    stylua
    nixfmt-rfc-style
    prettierd

    # php stuff :(
    (php83.buildEnv {
      extraConfig = ''
        memory_limit = 2G
        extension = ${php83Extensions.imagick}/lib/php/extensions/imagick.so
      '';
    })
    php83Packages.composer
    php83Extensions.imagick

    # UI
    lens
  ];
}
