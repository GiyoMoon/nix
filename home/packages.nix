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
        everforest-nvim = super.vimUtils.buildVimPlugin {
          pname = "everforest-nvim";
          version = "main";
          src = super.fetchFromGitHub {
            owner = "neanias";
            repo = "everforest-nvim";
            rev = "eedb19079c6bf9d162f74a5c48a6d2759f38cc76";
            sha256 = "sha256-/k6VBzXuap8FTqMij7EQCh32TWaDPR9vAvEHw20fMCo=";
          };
        };
        eldritch-nvim = super.vimUtils.buildVimPlugin {
          pname = "eldritch-nvim";
          version = "main";
          src = super.fetchFromGitHub {
            owner = "eldritch-theme";
            repo = "eldritch.nvim";
            rev = "4bd7d105ddf8ab843a538ba78fa71b32011a90fb";
            sha256 = "sha256-/FJ7o5c2RDO+i0yP+tsl3BmA8hvF/cCzJo00JXWmI0M=";
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
    elixir_1_16
    sqlx-cli

    # mobile development
    cocoapods

    # LSPs
    lua-language-server
    nil
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    elixir_ls

    # formatters
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
