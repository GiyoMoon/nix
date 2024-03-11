package.path = '/Users/jasi/.nix/home/programs/nvim/lua/?.lua;' .. package.path

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('opt')
require('cmd')
require('keymap')
require('plugins')

-- Has to be last
require('theme')
