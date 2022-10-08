-- plugins/zen.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local utils = require('utils')

require('zen-mode').setup({})
require('true-zen').setup({})

utils.nmap('<leader>z', 'ZenMode')
