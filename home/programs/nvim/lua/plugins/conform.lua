local conform = require('conform')

conform.setup({
  notify_on_error = true,
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'eslint_d' },
    javascriptreact = { 'eslint_d' },
    typescript = { 'eslint_d' },
    typescriptreact = { 'eslint_d' },
    html = { 'eslint_d' },
    css = { 'eslint_d' },
    json = { 'eslint_d' },
    rust = { 'rustfmt' },
    nix = { 'nixfmt' },
  },
})
