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
vim.g.mapleader = ' '
vim.g.timeoutlen = 2000
vim.cmd('set mouse=nvi')

-------------
-- PLUGINS --
-------------
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
require('packer').startup(function(use)
    -- Packer package manager
    use 'wbthomason/packer.nvim'

    -- colorschemes
    use 'doums/darcula'
    use 'rafi/awesome-vim-colorschemes'
    use 'olimorris/onedarkpro.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'dracula/vim'
    use 'NTBBloodbath/doom-one.nvim'
    use 'shaunsingh/moonlight.nvim'
    use 'cocopon/iceberg.vim'
    use 'haystackandroid/carbonized'
    use 'gregsexton/Atom'
    use 'ayu-theme/ayu-vim'
    use 'tomasr/molokai'
    use 'savq/melange'

    -- filetree
    use 'ms-jpq/chadtree'
    use 'preservim/nerdtree'
    use 'tpope/vim-fugitive'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- lsp
    --use 'neovim/nvim-lspconfig' -- lspconfig
    use {'neoclide/coc.nvim', branch = 'release'} -- coc.nvim
    use 'rhysd/vim-clang-format' -- cpp clang format

    -- syntax 
    use 'jackguo380/vim-lsp-cxx-highlight' -- cpp
    --use 'mxw/vim-jsx'
    use 'pangloss/vim-javascript'
    --use 'neoclide/vim-jsx-improve'

    -- auto close brackets
    use 'jiangmiao/auto-pairs'

    -- fuzzy finding
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- icons
    use 'ryanoasis/vim-devicons'

    -- commenter
    use 'terrortylor/nvim-comment'
end)

require('nvim_comment').setup()

vim.cmd('let g:cpp_class_scope_highlight = 1')
vim.cmd('let g:cpp_member_variable_highlight = 1')
vim.cmd('let g:cpp_class_decl_highlight = 1')
vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')


---------------------
-- EDITOR SETTINGS --
---------------------
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

-----------------
-- COLORSCHEME --
-----------------
vim.opt.termguicolors = true
vim.cmd('colorscheme melange')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

------------------
-- AUTOCOMMANDS --
------------------
vim.cmd 'autocmd BufWinEnter,WinEnter term://* startinsert'
vim.cmd 'autocmd BufWritePost /home/alex/.config/nvim/*.lua :luafile %'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
vim.cmd 'autocmd DirChanged global :NERDTreeCWD'
vim.cmd 'autocmd BufWritePre *.c,*.cpp,*.h,*.hpp :ClangFormat'
vim.cmd 'autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue CocCommand prettier.formatFile'

-------------
-- LUALINE --
-------------
require('lualine').setup()

-------------------
-- NERD/CHADTree --
-------------------
vim.cmd('let NERDTreeAutoDeleteBuffer = 1')
vim.cmd('let NERDTreeMinimalUI = 1')
vim.cmd('let NERDTreeDirArrows = 1')
vim.cmd('let g:NERDTreeShowHidden = 1')


-----------------
-- KEYMAPPINGS --
-----------------

-- exit terminal mode
utils.map('t', '<Esc>', '<C-\\><C-N>')

-- writing and saving
utils.map('n', '<leader>ww','<cmd>w<CR>')
utils.map('n', '<leader>WW','<cmd>wall<CR>')
utils.map('n', '<leader>wq','<cmd>wq<CR>')
utils.map('n', '<leader>WQ','<cmd>wqall<CR>')
utils.map('n', '<leader>qq','<cmd>q<CR>')
utils.map('n', '<leader>QQ','<cmd>qall<CR>')
utils.map('n', '<leader>wo', '<cmd>w!<CR>')

-- qtile
utils.map('n', '<leader>qs', '<cmd>!qtile check<CR>')

-- opening a file tree
utils.map('n', '<leader>tr', '<cmd>NERDTreeToggle<CR>')

-- moving around windows
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

-- moving around tabs
utils.map('n', '<M-PageUp>', 'gT<CR>')
utils.map('t', '<M-PageUp>', 'gT<CR>')
utils.map('i', '<M-PageUp>', 'gT<CR>')
utils.map('n', '<M-PageDown>', 'gt<CR>')
utils.map('t', '<M-PageDown>', 'gt<CR>')
utils.map('i', '<M-PageDown>', 'gt<CR>')
utils.map('n', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('t', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('i', '<M-S-PageUp>', '<cmd>-tabmove<CR>')
utils.map('n', '<M-S-PageDown>', '<cmd>+tabmove<CR>')
utils.map('t', '<M-S-PageDown>', '<cmd>+tabmove<CR>')
utils.map('i', '<M-S-PageDown>', '<cmd>+tabmove<CR>')

-- spliting windows
utils.map('n', '<leader>hs', '<cmd>vsplit<CR>')
utils.map('n', '<leader>vs', '<cmd>split<CR>')
utils.map('n', '<leader>ot', '<cmd>terminal<CR>')
utils.map('n', '<leader>vt', '<cmd>split<CR><cmd>terminal<CR>i')
utils.map('n', '<leader>ht', '<cmd>vsplit<CR><cmd>terminal<CR>i')

-- telescope plugin
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')

-- I hate highlighting
utils.map('n', '<leader>nh', '<cmd>noh<CR>')

-- Packer
utils.map('n', '<leader>pi', '<cmd>PackerInstall<CR>');
utils.map('n', '<leader>pu', '<cmd>PackerUpdate<CR>');

-- commenting
utils.map('n', '<M-/>', '<cmd>CommentToggle<CR>')
utils.map('i', '<M-/>', '<cmd>CommentToggle<CR>')
utils.map('v', '<M-/>', "<cmd>'<,'>CommentToggle<CR>")

