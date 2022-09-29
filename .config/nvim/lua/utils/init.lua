-- utils/init.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local M = {}

M.map = function (mode, shortcut, command)
    vim.keymap.set(
        mode,
        shortcut,
        command,
        { noremap = true }
    )
end

M.nmap = function (shortcut, command)
    M.map('n', shortcut, '<cmd>' .. command .. '<CR>')
end

M.vmap = function (shortcut, command)
    M.map('v', shortcut, '<cmd>' .. command .. '<CR>')
end

M.imap = function (shortcut, command)
    M.map('i', shortcut, '<cmd>' .. command .. '<CR>')
end

M.tmap = function (shortcut, command)
    M.map('t', shortcut, '<cmd>' .. command .. '<CR>')
end

M.amap = function (shortcut, command)
    M.imap(shortcut, command)
    M.tmap(shortcut, command)
    M.nmap(shortcut, command)
end

return M
