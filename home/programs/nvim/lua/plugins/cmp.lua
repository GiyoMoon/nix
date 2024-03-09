local cmp = require('cmp')

local luasnip = require('luasnip')
luasnip.config.setup({})

cmp.setup({
  expand = function(args)
    luasnip.lsp_exapnd(args.body)
  end,
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
  formatting = {
    format = require('cmp-tailwind-colors').format,
  },
})
