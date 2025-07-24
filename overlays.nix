inputs: self: super: {
  vimPlugins = super.vimPlugins.extend (
    self': super': {
      eldritch = super.vimUtils.buildVimPlugin {
        name = "eldritch";
        src = inputs.eldritch;
      };
      everforest-lua = super.vimUtils.buildVimPlugin {
        name = "everforest-lua";
        src = inputs.everforest-lua;
      };
    }
  );
  # mdx-language-server = super.stdenv.mkDerivation {
  #   pname = "mdx-language-server";
  #   version = "0.5.2";
  #   src = super.fetchurl {
  #     url = "https://registry.npmjs.org/@mdx-js%2flanguage-server/-/language-server-0.5.2.tgz";
  #     sha256 = "sha256-8ef9dVVsH5yTva9ymY+EAZTz6FOZ7Zgu9kOv1wLaK4w=";
  #   };
  #   nativeBuildInputs = [
  #     nixpkgs.nodejs_22
  #   ];
  #   installPhase = ''
  #     mkdir -p $out/{bin,lib/mdx-language-server}
  #     npm install
  #     cp -r {lib,node_modules} $out/lib/mdx-language-server
  #     ln -s $out/lib/mdx-language-server/lib/mdx-language-server $out/bin/mdx-language-server
  #   '';
  # };
}
