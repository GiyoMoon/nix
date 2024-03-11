require('nvim-treesitter.configs').setup({
  auto_install = false,
  highlight = {
    enable = true,
  },
})

require('nvim-ts-autotag').setup()
