----------------
-- LSPCONFIG --
----------------
-- Configure a language server with lsp.<lsp-server>.setup(stuff...)
local lsp = require('lspconfig')
lsp.eslint.setup({})
lsp.clangd.setup({})
lsp.pyright.setup({})

-- sumneko lua-language-server specific
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')
lsp.sumneko_lua.setup({
    cmd =  { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'Lua 5.3',
                path = {
                    '?.lua',
                    '?/init.lua',
                    vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
                    vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
                    '/usr/share/5.3/?.lua',
                    '/usr/share/lua/5.3/?/init.lua'
                }
            },
            workspace = {
                library = {
                    [vim.fn.expand'~/.luarocks/share/lua/5.3'] = true,
                    ['/usr/share/lua/5.3'] = true
                }
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
