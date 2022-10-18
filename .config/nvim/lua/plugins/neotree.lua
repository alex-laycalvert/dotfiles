-- .config/nvim/plugins/neotree.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local utils = require('utils')

require('neo-tree').setup({
    close_if_last_window = false,
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
})

-- keybindings
utils.nmap('<leader><Tab>', 'Neotree toggle')
