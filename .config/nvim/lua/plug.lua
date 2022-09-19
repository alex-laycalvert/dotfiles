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
    -- plugin manager
    use { 'wbthomason/packer.nvim' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

    -- snippets
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }

    -- -- luasnips
    -- use { 'L3MON4D3/LuaSnip' }
    -- use { 'saadparwaiz1/cmp_luasnip' }

    -- -- ultisnips
    -- use { 'SirVer/ultisnips' }
    -- use { 'quangnguyen30192/cmp-nvim-ultisnips' }

    -- -- snippy
    -- use { 'dcampos/nvim-snippy' }
    -- use { 'dcampos/cmp-snippy' }

    -- colortheme
    use { 'dracula/vim' }

    -- filetree
    use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
    -- use { 'ms-jpq/coq_nvim', branch = 'coq' }
    -- use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    -- use { 'ms-jpq/coq.thirdparty', branch = '3p' }

    -- commentor
    use { 'terrortylor/nvim-comment' }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- icons
    use { 'ryanoasis/vim-devicons' }

    -- lazygit
    use { 'kdheepak/lazygit.nvim' }

    -- fuzzy finding of files and buffers
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- auto docs
    use { 'kkoomen/vim-doge' }
end)

require('nvim_comment').setup({
    comment_empty = false,
    operator_mapping = '<M-/>',
})
require('lualine').setup()
