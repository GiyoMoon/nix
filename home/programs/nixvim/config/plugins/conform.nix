{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        format_on_save = # lua
          ''
            function(bufnr)
              if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
              end
              return { timeout_ms = 1500, lsp_fallback = false }
            end
          '';
        formatters_by_ft = {
          css = [ "biome" ];
          javascript = [ "biome" ];
          javascriptreact = [ "biome" ];
          json = [ "biome" ];
          jsonc = [ "biome" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          rust = [ "rustfmt" ];
          typescript = [ "biome" ];
          typescriptreact = [ "biome" ];
        };
      };
    };
    userCommands = {
      Format = {
        command.__raw = ''
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
        command.__raw = ''
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
        command.__raw = ''
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
