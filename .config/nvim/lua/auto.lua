-- auto.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local auto = {}

function auto.setup()
    vim.cmd 'autocmd BufWinEnter,WinEnter term://* startinsert'
    vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
    vim.cmd 'autocmd DirChanged global :NERDTreeCWD'
end

return auto
