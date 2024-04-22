require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = '<C-c>',
      accept_word = false,
      accept_line = false,
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
  },
})

vim.keymap.set('n', '<leader>ct', require('copilot.suggestion').toggle_auto_trigger, { desc = '[C]opilot [T]oggle' })
