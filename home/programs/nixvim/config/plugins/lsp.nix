{ ... }:
{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      # capabilities = "capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)";
      servers = {
        nil_ls.enable = true;
        ts_ls = {
          enable = true;
          extraOptions = {
            init_options = {
              preferences = {
                importModuleSpecifierPreference = "non-relative";
              };
            };
          };
        };
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          extraOptions = {
            settings = {
              rust-analyzer = {
                cargo = {
                  allFeatures = true;
                  # target = "x86_64-pc-windows-msvc";
                };
                checkOnSave.command = "clippy";
              };
            };
          };
        };
        tailwindcss = {
          enable = true;
        };
        cssls.enable = true;
        html.enable = true;
        lua_ls = {
          enable = true;
          extraOptions = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = [ "vim" ];
                };
              };
            };
          };
        };
        eslint = {
          enable = true;
          extraOptions = {
            on_attach.__raw = ''
              function(_, bufnr)
                vim.api.nvim_create_autocmd('BufWritePre', {
                  buffer = bufnr,
                  command = 'EslintFixAll',
                })
              end
            '';
          };
        };
        biome = {
          enable = true;
        };
        elixirls = {
          enable = true;
          cmd = [ "elixir-ls" ];
        };
        astro.enable = true;
        gleam.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
        openscad_lsp.enable = true;
        # mdx_analyzer = {
        #    enable = false;
        #    package = pkgs.mdx-language-server;
        #  };
        clangd.enable = true;
      };
      preConfig = ''
        vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
        vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
      '';
    };
    autoCmd = [
      {
        event = [ "LspAttach" ];
        callback = {
          __raw = ''
            function(event)
                local map = function(keys, func, desc)
                  vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end
                local telescope = require('telescope.builtin')

                map('<leader>lh', vim.lsp.buf.hover, 'Hover documentation')

                map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gr', telescope.lsp_references, '[G]oto [R]eferences')
                map('gi', telescope.lsp_implementations, '[G]oto [I]mplementations')

                map('<leader>ltd', telescope.lsp_type_definitions, '[T]ype [D]efinition')
                map('<leader>lds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>lws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>lr', vim.lsp.buf.rename, '[R]ename')
                map('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')

                local client = vim.lsp.get_client_by_id(event.data.client_id)

                if client and client.server_capabilities.documentHighlightProvider then
                  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.document_highlight,
                  })
                  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.clear_references,
                  })
                end
              end
          '';
        };
      }
    ];
    plugins.schemastore.enable = true;
    extraConfigLua = ''
      -- Fix: https://github.com/neovim/neovim/issues/30985
      for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
        local default_diagnostic_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, result, context, config)
          if err ~= nil and err.code == -32802 then
            return
          end
          return default_diagnostic_handler(err, result, context, config)
        end
      end
    '';
  };
}
