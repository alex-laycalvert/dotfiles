-- alex-laycalvert
-- https://github.com/alex-laycalvert

local set = vim.opt
local g = vim.g

set.splitbelow = true
set.splitright = true

g.mapleader = ' '
g.timeoutlen = 500
set.expandtab = true
set.smartindent = true
set.mouse = 'nvi'
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.clipboard = 'unnamedplus'
set.number = true
set.ch = 0
set.completeopt = { 'menu', 'menuone', 'noselect' }

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
