-- options/options.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local set = vim.opt
local g = vim.g
local api = vim.api

g.mapleader = ' '
g.timeoutlen = 100

set.splitbelow = true
set.splitright = true
set.expandtab = true
set.smartindent = true
set.mouse = 'nvi'
set.number = true
set.termguicolors = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.clipboard = 'unnamedplus'

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.cmd 'autocmd BufWinEnter,WinEnter term://* startinsert'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
