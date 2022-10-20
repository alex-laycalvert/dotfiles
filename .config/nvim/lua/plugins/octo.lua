-- plugins/octo.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local utils = require('utils')

-- keybindings

utils.nmap('<leader>gii', 'Octo issue list')
utils.nmap('<leader>gic', 'Octo issue close')
utils.nmap('<leader>gia', 'Octo issue create')
utils.nmap('<leader>gie', 'Octo issue edit')
utils.nmap('<leader>grr', 'Octo pr list')
utils.nmap('<leader>gre', 'Octo pr edit')
utils.nmap('<leader>grm', 'Octo pr list states=MERGED')
utils.nmap('<leader>gra', 'Octo pr create')
utils.nmap('<leader>gio', 'Octo issue browser')
utils.nmap('<leader>gca', 'Octo comment add')
utils.nmap('<leader>gcd', 'Octo comment delete')
utils.nmap('<leader>gla', 'Octo label add')
utils.nmap('<leader>gld', 'Octo label delete')
utils.nmap('<leader>glc', 'Octo label create')
utils.nmap('<leader>gaa', 'Octo assignee add')
utils.nmap('<leader>gad', 'Octo assignee remove')
