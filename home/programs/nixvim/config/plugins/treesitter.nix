{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight = {
            enable = true;
            disable.__raw = # lua
              ''
                function(lang, buf)
                  local max_char_count = 100000
                  local line_count = vim.api.nvim_buf_line_count(buf)
                  if line_count == 1 then
                    local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
                        if line ~= nil and #line > max_char_count then
                        return true
                      else
                        return false
                      end
                    end
                  end
              '';
          };
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
