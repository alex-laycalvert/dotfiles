-- plugins/comment.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local utils = require('utils')

require('nvim_comment').setup({
    comment_empty = false,
    operator_mapping = '<M-/>',
})

-- keybindings
utils.amap('<M-/>', 'CommentToggle')
