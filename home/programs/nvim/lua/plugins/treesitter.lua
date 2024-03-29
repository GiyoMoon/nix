require('nvim-treesitter.configs').setup({
  auto_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

vim.treesitter.language.register('markdown', 'mdx')
vim.filetype.add({
  extension = {
    mdx = 'mdx',
  },
})

require('nvim-ts-autotag').setup()
