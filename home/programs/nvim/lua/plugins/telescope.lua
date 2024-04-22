require('telescope').setup({
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})
require('telescope').load_extension('frecency')
require('telescope').load_extension('undo')
require('telescope').load_extension('undo')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set(
  'n',
  '<leader>fg',
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = '[F]ind by [G]rep' }
)
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fu', '<Cmd>Telescope undo<CR>', { desc = '[F]ind [U]ndo' })
vim.keymap.set('n', '<leader><leader>', '<Cmd>Telescope frecency workspace=CWD<CR>', { desc = 'Find by frecency' })
