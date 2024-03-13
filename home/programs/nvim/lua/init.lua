package.path = '/Users/jasi/.nix/home/programs/nvim/lua/?.lua;' .. package.path

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('cmd')
require('keymap')
require('opt')
require('plugins')
require('theme')
