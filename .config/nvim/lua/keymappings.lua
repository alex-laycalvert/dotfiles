-----------------
-- KEYMAPPINGS --
-----------------
local utils = require('utils')

-- Pressing escape key to go into normal mode in a terminal
utils.map('t', '<Esc>', '<C-\\><C-N>')

-- Saving and Exiting
-----------------------
utils.map('n', '<leader>ww','<cmd>w<CR>')
utils.map('n', '<leader>WW','<cmd>wall<CR>')
utils.map('n', '<leader>wq','<cmd>wq<CR>')
utils.map('n', '<leader>WQ','<cmd>wqall<CR>')
utils.map('n', '<leader>qq','<cmd>q<CR>')
utils.map('n', '<leader>QQ','<cmd>qall<CR>')
utils.map('n', '<leader>wo', '<cmd>w!<CR>')

-- Telescope Plugin Remappings
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')

-- CHADtree Plugin
utils.map('n', '<leader>tr', '<cmd>CHADopen<CR>')

-- EslintFixAll
utils.map('n', '<leader>es', '<cmd>EslintFixAll<CR>')

-- Qtile Check on config.py Save
utils.map('n', '<leader>qs', '<cmd>!qtile check<CR>')

-- Window moving with wincmd
----------------------------------------------------------
-- Uses h,j,k,l keys to move around like in normal mode
-- Alt key and h,j,k,l will move around to different open
-- split screens.
-- Alt and H,J,K,L to resise screens
-- Autocmd in main init.lua to enter terminal mode
-- when entering a terminal buffer
utils.map('n', '<M-h>', '<cmd>wincmd h<CR>')
utils.map('i', '<M-h>', '<cmd>wincmd h<CR>')
utils.map('t', '<M-h>', '<cmd>wincmd h<CR>')
utils.map('n', '<M-j>', '<cmd>wincmd j<CR>')
utils.map('i', '<M-j>', '<cmd>wincmd j<CR>')
utils.map('t', '<M-j>', '<cmd>wincmd j<CR>')
utils.map('n', '<M-k>', '<cmd>wincmd k<CR>')
utils.map('i', '<M-k>', '<cmd>wincmd k<CR>')
utils.map('t', '<M-k>', '<cmd>wincmd k<CR>')
utils.map('n', '<M-l>', '<cmd>wincmd l<CR>')
utils.map('i', '<M-l>', '<cmd>wincmd l<CR>')
utils.map('t', '<M-l>', '<cmd>wincmd l<CR>')
utils.map('n', '<M-H>', '<cmd>wincmd <<CR>')
utils.map('i', '<M-H>', '<cmd>wincmd <<CR>')
utils.map('t', '<M-H>', '<cmd>wincmd <<CR>')
utils.map('n', '<M-J>', '<cmd>wincmd -<CR>')
utils.map('i', '<M-J>', '<cmd>wincmd -<CR>')
utils.map('t', '<M-J>', '<cmd>wincmd -<CR>')
utils.map('n', '<M-K>', '<cmd>wincmd +<CR>')
utils.map('i', '<M-K>', '<cmd>wincmd +<CR>')
utils.map('t', '<M-K>', '<cmd>wincmd +<CR>')
utils.map('n', '<M-L>', '<cmd>wincmd ><CR>')
utils.map('i', '<M-L>', '<cmd>wincmd ><CR>')
utils.map('t', '<M-L>', '<cmd>wincmd ><CR>')

-- Moving Tabs Around
utils.map('n', '<M-PageUp>', 'gT<CR>')
utils.map('i', '<M-PageUp>', 'gT<CR>')
utils.map('n', '<M-PageDown>', 'gt<CR>')
utils.map('i', '<M-PageDown>', 'gt<CR>')
utils.map('n', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('i', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('n', '<M-S-PageDown>', '<cmd>+tabmove<CR>')
utils.map('i', '<M-S-PageDown>', '<cmd>+tabmove<CR>')

-- Splitting
--------------------------------------------------
-- When I think of vsplit I think of the opposite
-- type of split that vim does.
-- V should be vertical right?
utils.map('n', '<leader>hs', '<cmd>vsplit<CR>')
utils.map('n', '<leader>vs', '<cmd>split<CR>')

-- Open Terminal
utils.map('n', '<leader>ot', '<cmd>terminal<CR>')
utils.map('n', '<leader>vt', '<cmd>split<CR><cmd>terminal<CR>i')
utils.map('n', '<leader>ht', '<cmd>vsplit<CR><cmd>terminal<CR>i')
