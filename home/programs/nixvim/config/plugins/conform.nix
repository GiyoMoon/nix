{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      notifyOnError = true;
      formatOnSave = # lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 1500, lsp_fallback = false }
          end
        '';
      formattersByFt = {
        lua = [ "stylua" ];
        rust = [ "rustfmt" ];
        nix = [ "nixfmt" ];
      };
    };
    userCommands = {
      Format = {
        command = ''
          function(args)
            local range = nil
            if args.count ~= -1 then
              local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
              range = {
                start = { args.line1, 0 },
                ['end'] = { args.line2, end_line:len() },
              }
            end
            require('conform').format({ async = true, lsp_fallback = true, range = range })
          end
        '';
        range = true;
      };
      FormatDisable = {
        command = ''
          function(args)
            if args.bang then
              vim.b.disable_autoformat = true
            else
              vim.g.disable_autoformat = true
            end
          end
        '';
        desc = "Disable autoformat-on-save";
        bang = true;
      };
      FormatEnable = {
        command = ''
          function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
          end
        '';
        desc = "Re-enable autoformat-on-save";
      };
    };
  };
}
