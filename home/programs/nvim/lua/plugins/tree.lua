require('nvim-tree').setup({
  view = {
    side = 'right',
  },
  git = {
    enable = false,
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = false,
  },
})
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvim-tree [T]oggle' })
