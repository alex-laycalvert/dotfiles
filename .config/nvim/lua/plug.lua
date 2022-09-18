-- plug.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'dracula/vim'
    use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    use { 'ms-jpq/coq.thirdparty', branch = '3p' }
    use { 'terrortylor/nvim-comment' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use { 'ryanoasis/vim-devicons' }
    use { 'kdheepak/lazygit.nvim' }
    use { 'jiangmiao/auto-pairs' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'kkoomen/vim-doge' }
end)

require('nvim_comment').setup({
    comment_empty = false,
    operator_mapping = '<M-/>',
})
require('lualine').setup()

vim.g.AutoPairsShortcutJump = '<M-b>'
