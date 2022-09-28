-- plugins/treesitter.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "norg",
        "org",
        "c",
        "markdown",
        "markdown_inline",
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
    highlight = {
        enable = true,
    },
    sync_install = false,
    auto_install = true,
})
