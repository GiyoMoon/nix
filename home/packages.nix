{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  programs.bat.enable = true;
  programs.eza = {
    enable = true;
    icons = true;
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
    minikube
    jq
    lima
    xz
    fastlane
    coreutils

    # fonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Agave"
        "Monaspace"
      ];
    })

    # javascript
    nodejs_22
    pnpm
    nodePackages.yarn
    bun

    rustup
    elixir_1_16
    sqlx-cli

    # mobile development
    cocoapods
    temurin-bin-17

    # LSPs
    lua-language-server
    nil
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    elixir_ls
    nodePackages."@astrojs/language-server"

    # formatters
    stylua
    nixfmt-rfc-style

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
