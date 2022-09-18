-- lsp.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

vim.cmd([[let g:coq_settings = { 'auto_start': 'shut-up', 'keymap.jump_to_mark': '<M-n>' }]])

local lsp = require('lspconfig')
local coq = require('coq')

lsp.tsserver.setup(coq.lsp_ensure_capabilities())

vim.cmd('COQsnips compile')
