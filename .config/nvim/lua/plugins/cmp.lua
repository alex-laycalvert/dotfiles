-- plugins/cmp.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local cmp = require('cmp')

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
      ['<M-;>'] = cmp.mapping.complete(),
      ['<M-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<M-l>'] = cmp.mapping.confirm({ select = true }), 
      ['<M-n>'] = cmp.mapping.select_next_item({}),
      ['<M-b>'] = cmp.mapping.select_prev_item({}),
      ['<M-p>'] = cmp.mapping.select_prev_item({}),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'neorg' },
        { name = 'nvim_lua' },
        { name = 'vsnip' },
        { name = 'cmp_tabnine', max_item_count = 5 },
    }, {
        { name = 'buffer', keyword_length = 5 }
    })
})


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

-- keybindings
vim.cmd([[
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])

