{
  programs.nixvim.plugins = {
    notify = {
      enable = true;
      timeout = 2500;
    };
    noice = {
      enable = true;
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
      routes = [
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "written";
          };
          view = "mini";
        }
        {
          filter = {
            event = "wsg_show";
            kind = "";
            find = "more line";
          };
          view = "mini";
        }
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "fewer line";
          };
          view = "mini";
        }
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "lines yanked";
          };
          view = "mini";
        }
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "change; after";
          };
          view = "mini";
        }
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "change; before";
          };
          view = "mini";
        }
      ];
    };
  };
}
