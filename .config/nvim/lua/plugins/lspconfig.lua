-- alex-laycalvert
-- https://github.com/alex-laycalvert

local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local keymap = vim.keymap.set

local function set_lsp_keymaps ()
    keymap('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    keymap('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
    keymap('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
    keymap('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
    keymap('n', '<M-r>', vim.lsp.buf.rename, { buffer = 0 })
    keymap('n', '<M-a>', vim.lsp.buf.code_action, { buffer = 0 })
    keymap('n', '<M-n>', vim.diagnostic.goto_next, { buffer = 0 })
    keymap('n', '<M-p>', vim.diagnostic.goto_prev, { buffer = 0 })
end

-- typescript/javascript
lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = set_lsp_keymaps,
})

-- rust
lsp.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = set_lsp_keymaps,
})

-- python
lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = set_lsp_keymaps,
})

-- emmet
lsp.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = set_lsp_keymaps,
})

-- C/C++
lsp.clangd.setup({
    capabilities = capabilities,
    on_attach = set_lsp_keymaps,
})

-- haskell
lsp.ghcide.setup({
    capabilities = capabilities
})

-- lua
lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = set_lsp_keymaps,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
