-- .config/nvim/plugins/neotree.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local utils = require('utils')

require('neotree').setup({
    close_if_last_window = false,
})

-- keybindings
utils.nmap('<leader><Tab>', 'Neotree toggle')
