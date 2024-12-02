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
    elixir_1_16
    sqlx-cli
    gleam
    erlang_27
    rebar3

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
