-- plugins/lspconfig.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.tsserver.setup({ capabilities = capabilities })
lsp.pyright.setup({ capabilities = capabilities })
lsp.emmet_ls.setup({ capabilities = capabilities })
lsp.ccls.setup({ capabilities = capabilities })
lsp.sumneko_lua.setup({
    capabilities = capabilities,
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

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
