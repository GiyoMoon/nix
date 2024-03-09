require('nvim-tree').setup({
  view = {
    side = 'right',
  },
  git = {
    enable = false,
  },
})
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree' })
