{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        notify_on_no_formatters = false;
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
          astro = [ "prettierd" ];
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
          gleam = [ "gleam" ];
        };
        formatters = {
          biome.condition.__raw = # lua
            ''
              function(ctx)
                local config_exists = vim.fs.find({ 'biome.json' }, { upward = true, path = ctx.filename })
                return not vim.tbl_isempty(config_exists)
              end
            '';
          prettierd.condition.__raw = # lua
            ''
              function(ctx)
                local config_exists = vim.fs.find({ 'prettier.config.mjs' }, { upward = true, path = ctx.filename })
                return not vim.tbl_isempty(config_exists)
              end
            '';
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
