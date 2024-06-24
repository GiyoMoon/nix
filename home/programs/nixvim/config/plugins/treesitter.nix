{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      indent = true;
      grammarPackages = [ ];
      languageRegister = {
        markdown = "mdx";
      };
    };
    filetype = {
      extension = {
        mdx = "mdx";
      };
    };
    plugins.ts-autotag.enable = true;
  };
}
