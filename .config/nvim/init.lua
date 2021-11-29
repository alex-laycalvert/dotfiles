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

---------------------------
-- PACKER PLUGIN MANAGER --
---------------------------
-- bootstrapping packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-------------
-- PLUGINS --
-------------
require('packer').startup(function(use)
	-- Packer package manager
	use 'wbthomason/packer.nvim'

	-- colorschemes
	use 'liuchengxu/space-vim-dark'
    use 'arcticicestudio/nord-vim'
    use 'olimorris/onedarkpro.nvim'
    use 'ldelossa/vimdark'
    use 'kvrohit/substrata.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'FrenzyExists/aquarium-vim'
    use 'rose-pine/neovim'
    use 'dracula/vim'
    use 'NTBBloodbath/doom-one.nvim'
    use 'shaunsingh/moonlight.nvim'
    use 'cocopon/iceberg.vim'
    use 'yorickpeterse/happy_hacking.vim'
    use 'scheakur/vim-scheakur'
    use 'haystackandroid/carbonized'
    use 'gregsexton/Atom'
    use 'ayu-theme/ayu-vim'
    use 'tomasr/molokai'
    use 'savq/melange'

	-- telescope fuzzyfinder
	use {
  		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- language server
    use 'neovim/nvim-lspconfig'

    -- file trees
    use 'ms-jpq/chadtree'
    use 'preservim/nerdtree'
    --use 'Xuyuanp/nerdtree-git-plugin'
    use 'ryanoasis/vim-devicons'
end)

-----------------
-- COLORSCHEME --
-----------------
vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')

--------------------
-- UTILS FUNCTION --
--------------------
-- Easier way to set editor settings and keymappings
-- utils.opt to set options for a scope, settings, and value
-- utils.map to map a key combo in various modes
local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

---------------------
-- EDITOR SETTINGS --
---------------------
local indent = 4
vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', 4)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
--utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

------------------
-- AUTOCOMMANDS --
------------------
vim.cmd 'autocmd BufWinEnter,WinEnter term://* startinsert'
vim.cmd 'autocmd BufWritePost /home/alex/.config/nvim/init.lua :luafile %'


----------------
-- LSPCONFIG --
----------------
-- Configure a language server with lsp.<lsp-server>.setup(stuff...)
local lsp = require('lspconfig')
lsp.eslint.setup({})
lsp.clangd.setup({})
lsp.pyright.setup({})

-- sumneko lua-language-server specific
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')
local sumneko runtime_path = vim.split(package.path, ';')
lsp.sumneko_lua.setup({
    cmd =  { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'Lua 5.3',
                path = {
                    '?.lua',
                    '?/init.lua',
                    vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
                    vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
                    '/usr/share/5.3/?.lua',
                    '/usr/share/lua/5.3/?/init.lua'
                }
            },
            workspace = {
                library = {
                    [vim.fn.expand'~/.luarocks/share/lua/5.3'] = true,
                    ['/usr/share/lua/5.3'] = true
                }
            }
        }
    }
})

------------------------------------------
-- TELESCOPE FUZZY FINDER PLUGIN CONFIG --
------------------------------------------
local telescope = require('telescope')
telescope.setup({
    pickers = {
        find_files = {
            hidden = true
        }
    }
})

-----------------
-- KEYMAPPINGS --
-----------------
-- Pressing escape key to go into normal mode in a terminal
utils.map('t', '<Esc>', '<C-\\><C-N>')

-- Saving and Exiting
-----------------------
utils.map('n', '<leader>ww','<cmd>w<CR>')
utils.map('n', '<leader>WW','<cmd>wall<CR>')
utils.map('n', '<leader>wq','<cmd>wq<CR>')
utils.map('n', '<leader>WQ','<cmd>wqall<CR>')
utils.map('n', '<leader>qq','<cmd>q<CR>')
utils.map('n', '<leader>QQ','<cmd>qall<CR>')
utils.map('n', '<leader>wo', '<cmd>w!<CR>')

-- Telescope Plugin Remappings
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')

-- CHADtree Plugin
utils.map('n', '<leader>tr', '<cmd>NERDTreeToggle<CR>')

-- EslintFixAll
utils.map('n', '<leader>es', '<cmd>EslintFixAll<CR>')

-- Qtile Check on config.py Save
utils.map('n', '<leader>qs', '<cmd>!qtile check<CR>')

-- Window moving with wincmd
----------------------------------------------------------
-- Uses h,j,k,l keys to move around like in normal mode
-- Alt key and h,j,k,l will move around to different open
-- split screens. 
-- Alt and H,J,K,L to resise screens
-- Autocmd in main init.lua to enter terminal mode
-- when entering a terminal buffer
utils.map('n', '<M-h>', '<cmd>wincmd h<CR>')
utils.map('i', '<M-h>', '<cmd>wincmd h<CR>')
utils.map('t', '<M-h>', '<cmd>wincmd h<CR>')
utils.map('n', '<M-j>', '<cmd>wincmd j<CR>')
utils.map('i', '<M-j>', '<cmd>wincmd j<CR>')
utils.map('t', '<M-j>', '<cmd>wincmd j<CR>')
utils.map('n', '<M-k>', '<cmd>wincmd k<CR>')
utils.map('i', '<M-k>', '<cmd>wincmd k<CR>')
utils.map('t', '<M-k>', '<cmd>wincmd k<CR>')
utils.map('n', '<M-l>', '<cmd>wincmd l<CR>')
utils.map('i', '<M-l>', '<cmd>wincmd l<CR>')
utils.map('t', '<M-l>', '<cmd>wincmd l<CR>')
utils.map('n', '<M-H>', '<cmd>wincmd <<CR>')
utils.map('i', '<M-H>', '<cmd>wincmd <<CR>')
utils.map('t', '<M-H>', '<cmd>wincmd <<CR>')
utils.map('n', '<M-J>', '<cmd>wincmd -<CR>')
utils.map('i', '<M-J>', '<cmd>wincmd -<CR>')
utils.map('t', '<M-J>', '<cmd>wincmd -<CR>')
utils.map('n', '<M-K>', '<cmd>wincmd +<CR>')
utils.map('i', '<M-K>', '<cmd>wincmd +<CR>')
utils.map('t', '<M-K>', '<cmd>wincmd +<CR>')
utils.map('n', '<M-L>', '<cmd>wincmd ><CR>')
utils.map('i', '<M-L>', '<cmd>wincmd ><CR>')
utils.map('t', '<M-L>', '<cmd>wincmd ><CR>')

-- Moving Tabs Around
utils.map('n', '<M-PageUp>', 'gT<CR>')
utils.map('i', '<M-PageUp>', 'gT<CR>')
utils.map('n', '<M-PageDown>', 'gt<CR>')
utils.map('i', '<M-PageDown>', 'gt<CR>')
utils.map('n', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('i', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('n', '<M-S-PageDown>', '<cmd>+tabmove<CR>')
utils.map('i', '<M-S-PageDown>', '<cmd>+tabmove<CR>')

-- Splitting
--------------------------------------------------
-- When I think of vsplit I think of the opposite 
-- type of split that vim does. 
-- V should be vertical right?
utils.map('n', '<leader>hs', '<cmd>vsplit<CR>')
utils.map('n', '<leader>vs', '<cmd>split<CR>')
