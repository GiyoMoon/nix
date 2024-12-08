inputs: self: super: {
  vimPlugins = super.vimPlugins.extend (
    self': super': {
      cmp-tailwind-colors = super.vimUtils.buildVimPlugin {
        name = "cmp-tailwind-colors";
        src = inputs.cmp-tailwind-colors;
      };
      eldritch = super.vimUtils.buildVimPlugin {
        name = "eldritch";
        src = inputs.eldritch;
      };
      everforest-lua = super.vimUtils.buildVimPlugin {
        name = "everforest-lua";
        src = inputs.everforest-lua;
      };
      markdown = super.vimUtils.buildVimPlugin {
        name = "markdown";
        src = inputs.markdown;
      };
    }
  );

  # tailwind-language-server is outdated in nixpkgs and doesn't work with tailwind v4 beta
  tailwind-ls = super.stdenv.mkDerivation {
    pname = "tailwind-ls";
    version = "0.0.27";

    src = super.fetchurl {
      url = "https://registry.npmjs.org/@tailwindcss%2flanguage-server/-/language-server-0.0.27.tgz";
      sha256 = "sha256-08X2wR/82MfceaTZ0ubUH30SH/0aH73vmryPqt6r/4c=";
    };

    installPhase = ''
      mkdir -p $out/bin
      cp ./bin/tailwindcss-language-server $out/bin
    '';
  };
}
