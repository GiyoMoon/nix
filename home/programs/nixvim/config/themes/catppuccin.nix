{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      background = {
        light = "latte";
        dark = "macchiato";
      };
      transparent_background = true;
      show_end_of_buffer = false;
      no_italic = false;
      no_bold = false;
      no_underline = false;
      color_overrides = { };
      custom_highlights = { };
      integrations = {
        cmp = true;
        gitsigns = true;
        nvimtree = true;
        treesitter = true;
        notify = true;
        mini = {
          enabled = true;
          indentscope_color = "";
        };
      };
    };
  };
}
