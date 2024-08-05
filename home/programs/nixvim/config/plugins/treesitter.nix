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
          html = "mjml";
        };
      };
      ts-autotag.enable = true;
    };
    filetype = {
      extension = {
        mdx = "mdx";
        mjml = "mjml";
      };
    };
  };
}
