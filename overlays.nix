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
    }
  );
}
