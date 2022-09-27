-- plugins/sniprun.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

require('sniprun').setup({
    display = {
        "VirtualTextOk",
        "VirtualTextErr",
        "TempFloatingWindow"
    }
})

-- keybindings
vim.api.nvim_set_keymap('v', '<M-r>', '<Plug>SnipRun', { silent = true })
