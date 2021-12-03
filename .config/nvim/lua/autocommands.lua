
------------------
-- AUTOCOMMANDS --
------------------
-- Enter terminal mode when entering a terminal
vim.cmd 'autocmd BufWinEnter,WinEnter term://* startinsert'

-- Reload configs anytime a luafile in .config/nvim/* is edited
vim.cmd 'autocmd BufWritePost /home/alex/.config/nvim/**/*.lua :luafile %'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
