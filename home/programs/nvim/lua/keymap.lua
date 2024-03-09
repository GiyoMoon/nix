vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 's', '<nop>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search highlights when pressing <Esc>' })
vim.keymap.set('n', '<left>', '<cmd>echo "Silly you, use h to move :3"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Silly you, use l to move :3"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Silly you, use k to move :3"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Silly you, use j to move :3"<CR>')
vim.keymap.set('n', '<D-s>', '<cmd>w<cr>', { desc = 'Save remap' })

-- [[ movement ]]
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and keep cursor in the center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and keep cursor in the center' })
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo remap' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Find next and keep cursor in the center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Find previous and keep cursor in the center' })

-- [[ visual ]]
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without overriding the buffer' })
vim.keymap.set('x', '<leader>rw', 'y:%s/<C-r>0/<C-r>0/gc<left><left><left>', { desc = 'Replace Selection' })

-- [[ windows ]]
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

-- [[ diagnostics ]]
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- [[ diffview ]]
vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', { desc = 'Opens diffview' })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = 'Closes diffview' })

-- [[ telescope ]]
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fk', telescope.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fr', telescope.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader><leader>', '<Cmd>Telescope frecency workspace=CWD<CR>', { desc = 'Find by frecency' })
