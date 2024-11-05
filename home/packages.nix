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

    # fonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Agave"
        "Monaspace"
        "CascadiaCode"
        "GeistMono"
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
    biome
    elixir_ls
    lua-language-server
    nil
    nodePackages."@astrojs/language-server"
    nodePackages.typescript-language-server
    tailwindcss-language-server
    vscode-langservers-extracted

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

    # UI
    lens
  ];
}
