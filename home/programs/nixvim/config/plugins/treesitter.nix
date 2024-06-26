{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        indent = true;
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
