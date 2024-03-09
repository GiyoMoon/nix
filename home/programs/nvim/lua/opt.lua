vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'
vim.opt.list = true
vim.opt.listchars = { tab = '⇥ ', trail = '·', nbsp = '␣', space = '·' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 15
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250

local system_mode = os.execute('defaults read -g AppleInterfaceStyle > /dev/null 2> /dev/null') == 0 and 'dark'
  or 'light'
vim.opt.background = system_mode
