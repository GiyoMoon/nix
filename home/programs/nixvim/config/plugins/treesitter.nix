{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
        languageRegister = {
          markdown = "mdx";
        };
      };
      ts-autotag.enable = true;
    };
    filetype = {
      extension = {
        mdx = "mdx";
      };
    };
  };
}
