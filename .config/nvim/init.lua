-- .config/nvim/init.lua
-- alex-laycalvert

-- leader key
vim.g.mapleader = ' '
vim.g.timeoutlen = 2000
vim.cmd('set mouse=nvi')

-- plugins

-- bootstrapping packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)

	-- packer
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'dracula/vim'

	-- filetree
	use 'preservim/nerdtree'
	use 'Xuyuanp/nerdtree-git-plugin'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'

	-- lsp
	use {'neoclide/coc.nvim', branch = 'release'}	-- coc.nvim

	-- syntax highlighting
	use 'nvim-treesitter/nvim-treesitter'

	-- editor tools/settings
	use 'jiangmiao/auto-pairs'	-- auto close brackets
	use {				-- status line
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	    }

	use 'ryanoasis/vim-devicons' 	-- icons
	use 'terrortylor/nvim-comment' 	-- commenting


	-- language specific
	use 'iamcco/markdown-preview.nvim'
	use 'rhysd/vim-clang-format'
	use 'eclipse/eclipse.jdt.ls'

	-- git
	use 'kdheepak/lazygit.nvim'

end)

-- plugin setup
require('nvim_comment').setup()		-- commentor
vim.opt.termguicolors = true		-- colorscheme
vim.cmd('colorscheme dracula')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
require('lualine').setup()		-- statusline
vim.cmd('let NERDTreeAutoDeleteBuffer = 1') -- nerdtree
vim.cmd('let NERDTreeMinimalUI = 1')
vim.cmd('let NERDTreeDirArrows = 1')
vim.cmd('let g:NERDTreeShowHidden = 1')


-- nvim settings
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
utils.opt('o', 'clipboard','unnamed,unnamedplus')

-- autocommands
vim.cmd 'autocmd BufWinEnter,WinEnter term://* startinsert'
vim.cmd 'autocmd BufWritePost /home/alex/.config/nvim/*.lua :luafile %'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
vim.cmd 'autocmd DirChanged global :NERDTreeCWD'

-- keymappings
utils.map('t', '<Esc>', '<C-\\><C-N>')

utils.map('n', '<leader>w', '<cmd>w<CR>')
utils.map('n', '<leader>W', '<cmd>wall<CR>')
utils.map('n', '<leader>q', '<cmd>q<CR>')
utils.map('n', '<leader>Q', '<cmd>qall<CR>')
utils.map('n', '<leader>ow', '<cmd>w!<CR>')
utils.map('n', '<leader>oq', '<cmd>q!<CR>')

utils.map('n', '<leader><Tab>', '<cmd>NERDTreeToggle<CR>')

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

utils.map('n', '<leader>`', '<cmd>10split<CR><cmd>terminal<CR>i')
utils.map('n', '<leader>~', '<cmd>vsplit<CR><cmd>terminal<CR>i')
