local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')
lspconfig.nil_ls.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'non-relative',
    },
  },
})
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.tailwindcss.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.html.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
})
lspconfig.elixirls.setup({ capabilities = capabilities, cmd = { 'elixir-ls' } })
lspconfig.mdx_analyzer.setup({})
lspconfig.astro.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
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
  end,
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
