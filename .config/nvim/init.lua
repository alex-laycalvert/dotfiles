--------------------------------------------
--------------------------------------------
--                                        --
--     My Ultamite Neovim Configuration   --
--                                        --
--         author: alex-laycalvert        --
--                                        --
--   various functions stolen from others --
--                                        --
--------------------------------------------
--------------------------------------------


----------------
-- LEADER KEY --
----------------
-- Leader Key set to Space
vim.g.mapleader = ' '

-- Leader Key Timeout
vim.g.timeoutlen = 2000


require('plugins')
require('settings')
require('colorscheme')
require('autocommands')
require('lsp')
require('keymappings')

