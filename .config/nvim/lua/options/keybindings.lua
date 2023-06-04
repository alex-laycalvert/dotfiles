-- alex-laycalvert
-- https://github.com/alex-laycalvert

local keymap = vim.keymap.set

-- generic
keymap('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save File' })
keymap('n', '<leader>W', '<cmd>wall<cr>', { desc = 'Save All Open Files' })
keymap('n', '<leader>q', '<cmd>q<cr>', { desc = 'Close File' })
keymap('n', '<leader>Q', '<cmd>qall<cr>', { desc = 'Close All' })
keymap('n', '<leader>l', '<cmd>luafile %<cr>', { desc = 'Load Current Lua File' })
keymap('n', '<leader>h', '<cmd>noh<cr>', { desc = 'Turn off highlight from search' })
keymap('n', '<leader>gf', '!git fetch', { desc = 'Git Fetch' })
keymap('n', '<leader>gp', '!git pull', { desc = 'Git Pull' })
keymap('i', '<C-return>', '<esc>o', { desc = 'Add New Line Below' })
keymap('i', '<C-a>', '<esc>I', { desc = 'Terminal Ctrl-A Goto Start of Line' })
keymap('i', '<C-e>', '<esc>A', { desc = 'Terminal Ctrl-E Goto End of Line' })

-- windows
keymap({ 'n', 'i', 'v', 't' }, '<M-h>', '<cmd>wincmd h<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-j>', '<cmd>wincmd j<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-k>', '<cmd>wincmd k<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-l>', '<cmd>wincmd l<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-v>', '<cmd>vsplit<cr>')
keymap({ 'n', 'i', 'v' }, '<M-s>', '<cmd>split<cr>')

-- tabs
keymap({ 'n', 'i', 'v', 't' }, '<M-t>', '<cmd>tabnew<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-w>', '<cmd>tabclose<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-Tab>', '<cmd>tabnext<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-S-Tab>', '<cmd>tabprevious<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<C-M-h>', '<cmd>-tabmove<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<C-M-l>', '<cmd>+tabmove<cr>')

-- terminal
keymap('t', '<esc>', '<c-\\><c-n>')
keymap('n', '<leader><return>', '<cmd>10split<cr><cmd>terminal<cr><cmd>startinsert<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-return>', '<cmd>term<cr><cmd>startinsert<cr>')

-- plugins
keymap('n', '<leader>p', '<cmd>PackerUpdate<cr>')
keymap('n', '<leader>o', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>r', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fc', '<cmd>Telescope commands<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope search_history<cr>')
keymap('n', '<leader>fm', '<cmd>Telescope man_pages<cr>')
keymap('n', '<leader>fk', '<cmd>Telescope marks<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope projects<cr>')
keymap('n', '<leader>fd', '<cmd>Telescope dotfiles<cr>')
keymap('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>')
keymap('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')
keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
keymap({ 'n', 'i', 'v', 't' }, '<M-i>', '<cmd>Telescope symbols<cr>')
keymap('n', '<leader><Tab>', '<cmd>Neotree toggle<cr>')
keymap('n', '<leader>gii', '<cmd>Octo issue list<cr>')
keymap('n', '<leader>gic', '<cmd>Octo issue close<cr>')
keymap('n', '<leader>gia', '<cmd>Octo issue create<cr>')
keymap('n', '<leader>gie', '<cmd>Octo issue edit<cr>')
keymap('n', '<leader>gim', '<cmd>Octo issue list assignee=alex-laycalvert<cr>')
keymap('n', '<leader>grr', '<cmd>Octo pr list<cr>')
keymap('n', '<leader>gre', '<cmd>Octo pr edit<cr>')
keymap('n', '<leader>grm', '<cmd>Octo pr list states=MERGED<cr>')
keymap('n', '<leader>gra', '<cmd>Octo pr create<cr>')
keymap('n', '<leader>gio', '<cmd>Octo issue browser<cr>')
keymap('n', '<leader>gca', '<cmd>Octo comment add<cr>')
keymap('n', '<leader>gcd', '<cmd>Octo comment delete<cr>')
keymap('n', '<leader>gla', '<cmd>Octo label add<cr>')
keymap('n', '<leader>gld', '<cmd>Octo label delete<cr>')
keymap('n', '<leader>glc', '<cmd>Octo label create<cr>')
keymap('n', '<leader>gaa', '<cmd>Octo assignee add<cr>')
keymap('n', '<leader>gad', '<cmd>Octo assignee remove<cr>')
keymap('n', '<leader>z', '<cmd>ZenMode<cr>', { desc = 'Toggle ZenMode' })
keymap({'n', 'i', 'v' }, '<M-S-n>', function ()
    require('todo-comments').jump_next()
end, { desc = 'Jump to next TODO' })
keymap({'n', 'i', 'v' }, '<M-S-p>', function ()
    require('todo-comments').jump_prev()
end, { desc = 'Jump to previous TODO' })

-- file formatting
keymap({ 'n', 'i', 'v' }, '<M-f>', function ()
    local filetype = vim.bo.filetype
    if
        filetype == 'javascript' or
        filetype == 'typescript' or
        filetype == 'javascriptreact' or
        filetype == 'typescriptreact' or
        filetype == 'json' or
        filetype == 'css' or
        filetype == 'scss' or
        filetype == 'sass' or
        filetype == 'markdown' or
        filetype == 'html' then
        vim.cmd('Prettier')
    elseif
        filetype == 'c' or
        filetype == 'cpp' then
        vim.cmd('ClangFormat')
    elseif
        filetype == 'rust' then
        vim.lsp.buf.format({ timeout_ms = 2000 })
    end
end, { desc = 'Format File' })

keymap('n', '<leader>t', '<cmd>Telekasten toggle_todo<cr>')
keymap('v', '<leader>t', ':lua require("telekasten").toggle_todo({ v = true })<cr>')
