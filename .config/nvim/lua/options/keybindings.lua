-- options/keybindings.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local utils = require('utils')

-- saving/quitting
utils.nmap('<leader>w', 'w')
utils.nmap('<leader>W', 'wall')
utils.nmap('<leader>q', 'q')
utils.nmap('<leader>Q', 'qall')

-- moving in windows
utils.amap('<M-h>', 'wincmd h')
utils.amap('<M-j>', 'wincmd j')
utils.amap('<M-k>', 'wincmd k')
utils.amap('<M-l>', 'wincmd l')
utils.amap('<M-H>', 'wincmd <')
utils.amap('<M-J>', 'wincmd -')
utils.amap('<M-K>', 'wincmd +')
utils.amap('<M-L>', 'wincmd >')
utils.amap('<M-v>', 'vsplit')
utils.amap('<M-s>', 'split')

-- moving in tabs
utils.amap('<M-t>', 'tabnew')
utils.amap('<M-w>', 'tabclose')
utils.amap('<M-Tab>', 'tabnext')
utils.amap('<M-S-Tab>', 'tabprevious')
utils.amap('<C-M-h>', '-tabmove')
utils.amap('<C-M-l>', '+tabmove')

-- terminal
utils.map('t', '<ESC>', '<C-\\><C-N>')
utils.map('n', '<leader><return>', '<cmd>10split<CR><cmd>terminal<CR>i')
utils.map('n', '<M-return>', '<cmd>term<CR>i')
utils.map('i', '<M-return>', '<cmd>term<CR>i')
utils.map('t', '<M-return>', '<cmd>term<CR>i')
utils.map('v', '<M-return>', '<cmd>term<CR>i')

-- misc.
utils.map('n', '<leader>t', 'OTODO<Esc><cmd>CommentToggle<CR>j')
utils.nmap('<leader>n', 'noh')
utils.nmap('<leader>l', 'luafile %')
utils.nmap('<leader>gf', '!git fetch')
utils.nmap('<leader>gp', '!git pull')
