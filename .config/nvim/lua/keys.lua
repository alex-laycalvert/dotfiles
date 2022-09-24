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
nmap('<leader>W', 'wall')
nmap('<leader>q', 'q')
nmap('<leader>Q', 'qall')

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
nmap('<leader>r', 'lua require("telescope.builtin").live_grep()')
nmap('<leader>f', 'lua require("telescope.builtin").find_files()')
nmap('<leader>ff', 'lua require("telescope.builtin").find_files()')
nmap('<leader>fr', 'lua require("telescope.builtin").oldfiles()')
nmap('<leader>fb', 'lua require("telescope.builtin").buffers()')
nmap('<leader>fc', 'lua require("telescope.builtin").commands()')
nmap('<leader>fh', 'lua require("telescope.builtin").search_history()')
nmap('<leader>fm', 'lua require("telescope.builtin").man_pages()')
nmap('<leader>fk', 'lua require("telescope.builtin").marks()')
nmap('<leader>fq', 'lua require("telescope.builtin").quickfix()')
nmap('<leader>fd', 'Telescope dotfiles')
nmap('<leader>fg', 'Telescope projects')

-- commenting
amap('<M-/>', 'CommentToggle')

-- telekasten
nmap('<leader>o', 'lua require("telekasten").panel()')
nmap('<leader>oo', 'lua require("telekasten").find_notes()')
nmap('<leader>os', 'lua require("telekasten").search_notes()')
nmap('<leader>of', 'lua require("telekasten").follow_link()')
nmap('<leader>od', 'lua require("telekasten").goto_today()')
nmap('<leader>ow', 'lua require("telekasten").goto_thisweek()')
nmap('<leader>oD', 'lua require("telekasten").find_daily_notes()')
nmap('<leader>oW', 'lua require("telekasten").find_weekly_notes()')
nmap('<leader>oc', 'lua require("telekasten").show_calendar()')
nmap('<leader>oC', 'CalendarT')
nmap('<leader>ol', 'lua require("telekasten").insert_link()')
nmap('<leader>oL', 'lua require("telekasten").insert_img_link({ i = true })')
nmap('<leader>oi', 'lua require("telekasten").preview_img()')
nmap('<leader>oI', 'lua require("telekasten").paste_img_and_link()')
nmap('<leader>ob', 'lua require("telekasten").show_backlinks()')
nmap('<leader>oF', 'lua require("telekasten").find_friends()')
nmap('<leader>om', 'lua require("telekasten").browse_media()')
nmap('<leader>on', 'lua require("telekasten").new_note()')
nmap('<leader>oN', 'lua require("telekasten").new_templated_note()')
nmap('<leader>ot', 'lua require("telekasten").toggle_todo()')
nmap('<leader>oy', 'lua require("telekasten").yank_notelink()')
nmap('<leader>or', 'lua require("telekasten").rename_note()')
nmap('<leader>oT', 'lua require("telekasten").show_tags()')

-- misc
map('n', '<leader>t', 'OTODO<Esc><cmd>CommentToggle<CR>j')
nmap('<leader>n', 'noh')
nmap('<leader>l', 'luafile %')
nmap('<leader>p', 'PackerUpdate')
amap('<M-i>', 'Telescope symbols')
vim.api.nvim_set_keymap('v', '<M-r>', '<Plug>SnipRun', { silent = true })
