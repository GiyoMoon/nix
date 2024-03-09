vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', { command = ':silent !kitty @ set-spacing padding=0' })
vim.api.nvim_create_autocmd('VimLeave', { command = ':silent !kitty @ set-spacing padding=default' })

vim.api.nvim_create_user_command('DarkTheme', function()
  vim.opt.background = 'dark'
end, {})

vim.api.nvim_create_user_command('LightTheme', function()
  vim.opt.background = 'light'
end, {})
