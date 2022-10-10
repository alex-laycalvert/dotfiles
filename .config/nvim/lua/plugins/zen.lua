-- plugins/zen.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local utils = require('utils')

require('zen-mode').setup({})

utils.nmap('<leader>z', 'ZenMode')
