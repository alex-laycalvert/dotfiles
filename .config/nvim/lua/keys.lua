-- keys.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local function map(mode, shortcut, command)
    vim.keymap.set(
        mode,
        shortcut,
        command,
        { noremap = true }
    )
end

local function nmap(shortcut, command)
    map('n', shortcut, '<cmd>' .. command .. '<CR>')
end

local function vmap(shortcut, command)
    map('v', shortcut, '<cmd>' .. command .. '<CR>')
end

local function imap(shortcut, command)
    map('i', shortcut, '<cmd>' .. command .. '<CR>')
end

local function tmap(shortcut, command)
    map('t', shortcut, '<cmd>' .. command .. '<CR>')
end

local function amap(shortcut, command)
    imap(shortcut, command)
    tmap(shortcut, command)
    nmap(shortcut, command)
end

local function ldrmap(shortcut, command)
    nmap('<leader>' .. shortcut, command)
end

-- system
nmap('<leader>w', 'w')
nmap('<leader>ow', 'w!')
nmap('<leader>W', 'wall')
nmap('<leader>OW', 'wall!')
nmap('<leader>q', 'q')
nmap('<leader>oq', 'q!')
nmap('<leader>Q', 'qall')
nmap('<leader>OQ', 'qall!')

-- filetree
nmap('<leader><Tab>', 'CHADopen')

-- windows
amap('<M-h>', 'wincmd h')
amap('<M-j>', 'wincmd j')
amap('<M-k>', 'wincmd k')
amap('<M-l>', 'wincmd l')
amap('<M-H>', 'wincmd <')
amap('<M-J>', 'wincmd -')
amap('<M-K>', 'wincmd +')
amap('<M-L>', 'wincmd >')
amap('<M-v>', 'vsplit')
amap('<M-s>', 'split')

-- tabs
amap('<M-t>', 'tabnew')
amap('<M-w>', 'tabclose')
amap('<M-Tab>', 'tabnext')
amap('<M-S-Tab>', 'tabprevious')
amap('<M-PageUp>', '-tabmove')
amap('<M-PageDown>', '+tabmove')

-- terminal
map('t', '<ESC>', '<C-\\><C-N>')
map('n', '<leader><return>', '<cmd>10split<CR><cmd>terminal<CR>i')
map('n', '<M-return>', '<cmd>term<CR>i')
map('i', '<M-return>', '<cmd>term<CR>i')
map('t', '<M-return>', '<cmd>term<CR>i')
map('v', '<M-return>', '<cmd>term<CR>i')

-- git
nmap('<leader>g', 'LazyGit')

-- telescope
nmap('<leader>f', 'Telescope find_files')
nmap('<leader>b', 'Telescope buffers')
nmap('<leader>r', 'Telescope live_grep')

-- commenting
amap('<M-/>', 'CommentToggle')

-- telekasten
nmap('<leader>oo', 'lua require("telekasten").panel()')
nmap('<leader>of', 'lua require("telekasten").find_notes()')
nmap('<leader>od', 'lua require("telekasten").find_daily_notes()')
nmap('<leader>ow', 'lua require("telekasten").find_weekly_notes()')
nmap('<leader>os', 'lua require("telekasten").search_notes()')
nmap('<leader>og', 'lua require("telekasten").follow_link()')
nmap('<leader>on', 'lua require("telekasten").new_note()')
nmap('<leader>ot', 'lua require("telekasten").new_templated_note()')
nmap('<leader>oo', 'lua require("telekasten").panel()')

-- misc
map('n', '<leader>t', 'OTODO<Esc><cmd>CommentToggle<CR>j')
nmap('<leader>n', 'noh')
nmap('<leader>l', 'luafile %')
nmap('<leader>p', 'PackerUpdate')
vim.api.nvim_set_keymap('v', '<M-r>', '<Plug>SnipRun', { silent = true })
amap('<M-i>', 'Telescope symbols')
