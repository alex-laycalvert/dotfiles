-- lsp.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

--------------------------
--- SETUP FOR cmp-nvim ---
--------------------------
local cmp = require('cmp')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.cmd('set completeopt=menu,menuone,noselect')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- vsnip
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<M-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          elseif has_words_before() then
              cmp.complete()
          else
              fallback()
          end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'cmp_tabnine' },
        { name = 'orgmode' },
        { name = 'tags' },
    }, {
        { name = 'buffer' }
    })
})

vim.cmd([[
    imap <expr> <M-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <M-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-M-n> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-M-n> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' }
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').tsserver.setup { capabilities = capabilities }
require('lspconfig').pyright.setup { capabilities = capabilities }
require('lspconfig').luau_lsp.setup { capabilities = capabilities }
require('lspconfig').marksman.setup { capabilities = capabilities }
require('lspconfig').emmet_ls.setup { capabilities = capabilities }

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "norg",
        "org",
        "c",
        "markdown",
        "rust",
        "lua",
        "javascript",
        "typescript",
        "bash",
        "cpp",
        "html",
        "json",
        "tsx",
        "dockerfile",
        "http",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org', 'norg' }
    }
})

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
