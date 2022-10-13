-- plugins/treesitter.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'norg',
        'css',
        'scss',
        'fish',
        'c',
        'cpp',
        'make',
        'markdown',
        'rust',
        'lua',
        'javascript',
        'typescript',
        'bash',
        'cpp',
        'html',
        'json',
        'tsx',
        'dockerfile',
        'http',
    },
    highlight = {
        enable = true,
    },
})

