{
  programs.nixvim.plugins = {
    notify = {
      enable = true;
      settings = {
        timeout = 1000;
      };
    };
    noice = {
      enable = true;
      settings = {
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = false;
        };
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
        messages = {
          enabled = true;
          view = "mini";
          viewError = "notify";
        };
      };
    };
  };
}
