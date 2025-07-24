-- catppuccin
-- eldritch - dark only
-- everforest
-- rose-pine
-- tokyonight
local LIGHT_COLORSCHEME = 'rose-pine'
local DARK_COLORSCHEME = 'rose-pine'

local light = function()
  vim.cmd.colorscheme(LIGHT_COLORSCHEME)
  vim.opt.background = 'light'
end

local dark = function()
  vim.cmd.colorscheme(DARK_COLORSCHEME)
  vim.opt.background = 'dark'
end

vim.api.nvim_create_user_command('LightTheme', light, {})
vim.api.nvim_create_user_command('DarkTheme', dark, {})

local system_scheme = os.execute('defaults read -g AppleInterfaceStyle > /dev/null 2> /dev/null') == 0 and dark or light
system_scheme()
