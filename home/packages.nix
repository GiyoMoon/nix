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

  nixpkgs.overlays = [
    (self: super: {
      hinode = pkgs.callPackage "${pkgs.fetchFromGitHub {
        owner = "GiyoMoon";
        repo = "hinode";
        rev = "a15255357472fc19ba6b2a5272ec136e659d3e3c";
        sha256 = "sha256-rbFwQn52aoIUWhx+zyiJRqcdNRGaDowblpk/DCqHXUs=";
      }}" { };
      vimPlugins = super.vimPlugins // {
        harpoon = super.vimUtils.buildVimPlugin {
          pname = "harpoon";
          version = "v2";
          src = super.fetchFromGitHub {
            owner = "ThePrimeagen";
            repo = "harpoon";
            rev = "a38be6e0dd4c6db66997deab71fc4453ace97f9c";
            sha256 = "sha256-RjwNUuKQpLkRBX3F9o25Vqvpu3Ah1TCFQ5Dk4jXhsbI=";
          };
        };
        cmp-tailwind-colors = super.vimUtils.buildVimPlugin {
          pname = "cmp-tailwind-colors";
          version = "main";
          src = super.fetchFromGitHub {
            owner = "js-everts";
            repo = "cmp-tailwind-colors";
            rev = "8ad13923316e2b5ca00420c171268fc23f32c01d";
            sha256 = "sha256-JdMrbHG5hgrY8HMRkGMXyc7ZFKQi7bSEv4ZPVMlVR24=";
          };
        };
      };
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
    hyperfine

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

    # LSPs
    lua-language-server
    nil
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages.typescript-language-server

    # formatters
    eslint_d
    stylua
    nixfmt

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
