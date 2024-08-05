{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
        tsserver = {
          enable = true;
          extraOptions = {
            init_options = {
              preferences = {
                importModuleSpecifierPreference = "non-relative";
              };
            };
          };
        };
        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          extraOptions = {
            settings = {
              rust-analyzer = {
                checkOnSave.command = "clippy";
              };
            };
          };
        };
        tailwindcss.enable = true;
        cssls.enable = true;
        html.enable = true;
        lua-ls = {
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
            on_attach.__raw = # lua
              ''
                function(_, bufnr)
                  vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = bufnr,
                    command = 'EslintFixAll',
                  })
                end
              '';
          };
        };
        elixirls = {
          enable = true;
          cmd = [ "elixir-ls" ];
        };
        astro.enable = true;
        jsonls = {
          enable = true;
          extraOptions = {
            settings = {
              json = {
                schemas = [
                  {
                    fileMatch = [ "package.json" ];
                    url = "https://json.schemastore.org/package.json";
                  }
                  {
                    fileMatch = [ "tsconfig*.json" ];
                    url = "https://json.schemastore.org/tsconfig.json";
                  }
                  {
                    fileMatch = [
                      ".prettierrc"
                      ".prettierrc.json"
                      "prettier.config.json"
                    ];
                    url = "https://json.schemastore.org/prettierrc.json";
                  }
                  {
                    fileMatch = [
                      ".eslintrc"
                      ".eslintrc.json"
                    ];
                    url = "https://json.schemastore.org/eslintrc.json";
                  }
                  {
                    fileMatch = [
                      ".babelrc"
                      ".babelrc.json"
                      "babel.config.json"
                    ];
                    url = "https://json.schemastore.org/babelrc.json";
                  }
                ];
              };
            };
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  "https://json.schemastore.org/github-workflow.json" = "/.github/workflows/*";
                  "https://json.schemastore.org/github-action.json" = "/.github/actions/*";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "{docker-compose,compose}*.{yml,yaml}";
                };
              };
            };
          };
        };
      };
      preConfig = ''
        require('lspconfig').mdx_analyzer.setup({})
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
          __raw = # lua
            ''
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
  };
}
