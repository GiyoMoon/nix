require('telescope').load_extension('frecency')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader><leader>', '<Cmd>Telescope frecency workspace=CWD<CR>', { desc = 'Find by frecency' })
