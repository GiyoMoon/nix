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
      markdown = super.vimUtils.buildVimPlugin {
        name = "markdown";
        src = inputs.markdown;
      };
      blink-cmp-copilot = super.vimUtils.buildVimPlugin {
        name = "blink-cmp-copilot";
        src = inputs.blink-cmp-copilot;
      };
    }
  );
}
