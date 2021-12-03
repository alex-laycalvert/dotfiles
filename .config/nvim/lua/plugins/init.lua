---------------------------
-- PACKER PLUGIN MANAGER --
---------------------------
-- bootstrapping packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-------------
-- PLUGINS --
-------------
require('packer').startup(function(use)
	-- Packer package manager
	use 'wbthomason/packer.nvim'

	-- colorschemes
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

    -- language server
    use 'neovim/nvim-lspconfig'

    -- file trees
    use 'ms-jpq/chadtree'
end)
