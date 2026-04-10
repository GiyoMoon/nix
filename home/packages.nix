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
    rainfrog
    restic
    rclone
    tor
    xmrig
    btop
    deploy-rs

    wasm-pack

    nerd-fonts.fira-code
    nerd-fonts.agave
    nerd-fonts.monaspace
    nerd-fonts.caskaydia-cove
    nerd-fonts.geist-mono
    nerd-fonts.symbols-only
    maple-mono.NF

    # javascript
    nodejs_22
    pnpm
    yarn
    bun

    rustup
    sqlx-cli

    jujutsu
    gleam
    beam.packages.erlang_28.erlang

    claude-code

    mumble

    # mobile development
    cocoapods
    temurin-bin-17

    # formatters
    stylua
    nixfmt
    prettierd

    # php stuff :(
    (php85.buildEnv {
      extraConfig = ''
        memory_limit = 2G
        extension = ${php85Extensions.imagick}/lib/php/extensions/imagick.so
      '';
    })
    php85Packages.composer
    php85Extensions.imagick

    wireguard-tools
  ];
}
