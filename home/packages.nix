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
            rev = "0378a6c428a0bed6a2781d459d7943843f374bce";
            sha256 = "sha256-FZQH38E02HuRPIPAog/nWM55FuBxKp8AyrEldFkoLYk=";
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
            rev = "5e0e32a569fb464911342f0d421721cc1c94cf25";
            sha256 = "sha256-qKyPqkcf420eMbgGNXmMgF3i9GZ71NpoqeK3+Gz0fzc=";
          };
        };
        eldritch-nvim = super.vimUtils.buildVimPlugin {
          pname = "eldritch-nvim";
          version = "main";
          src = super.fetchFromGitHub {
            owner = "eldritch-theme";
            repo = "eldritch.nvim";
            rev = "754e9dd1ea529ce72efa754584c35daaa87e65fa";
            sha256 = "sha256-XwvI2URsZ4aFCoZFWlfN5e3rp8tJZc9x6bI0p1c/0oA=";
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
