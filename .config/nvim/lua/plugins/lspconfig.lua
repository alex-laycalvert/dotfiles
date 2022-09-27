-- plugins/lspconfig.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.tsserver.setup({ capabilities = capabilities })
lsp.pyright.setup({ capabilities = capabilities })
lsp.emmet_ls.setup({ capabilities = capabilities })

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
