-- alex-laycalvert
-- https://github.com/alex-laycalvert

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
    })
end

require('packer').startup({
    function (use)

        -- packer
        use({ 'wbthomason/packer.nvim' })

        -- tree-sitter
        use({
            'nvim-treesitter/nvim-treesitter',
            run =  function () require('nvim-treesitter.install').update({ with_sync = true }) end
        })

        -- colorscheme
        use({ 'folke/tokyonight.nvim' })

        -- filetree
        use({
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v2.x',
            requires = {
                'nvim-lua/plenary.nvim',
                'kyazdani42/nvim-web-devicons',
                'MunifTanjim/nui.nvim',
            }
        })

        -- zenmode
        use({ 'folke/zen-mode.nvim' })

        -- icons
        use({ 'kyazdani42/nvim-web-devicons' })

        -- git
        use({ 'pwntester/octo.nvim' })

        -- which-key
        use({ 'folke/which-key.nvim' })

        -- formatting
        use({ 'rhysd/vim-clang-format' })

        -- telescope
        use({ 'nvim-telescope/telescope.nvim' })
        use({ 'nvim-telescope/telescope-media-files.nvim' })
        use({ 'nvim-telescope/telescope-symbols.nvim' })
        use({ 'alex-laycalvert/telescope-dotfiles.nvim' })
        use({ 'alex-laycalvert/telescope-projects.nvim' })

        -- dashboard
        use({ 'glepnir/dashboard-nvim' })

        -- lsp
        use({ 'neovim/nvim-lspconfig' })

        -- autocomplete
        use({ 'hrsh7th/nvim-cmp' })
        use({ 'hrsh7th/cmp-nvim-lsp' })
        use({ 'hrsh7th/cmp-buffer' })
        use({ 'hrsh7th/cmp-path' })
        use({ 'L3MON4D3/LuaSnip' })
        use({ 'saadparwaiz1/cmp_luasnip' })

        use({ '~/git/telekasten.nvim' })

        use({ 'elkowar/yuck.vim' })
        use({ 'prettier/vim-prettier' })
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    },
})

require('plugins.lspconfig')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.neotree')
require('plugins.octo')
require('plugins.dashboard')
require('plugins.telekasten')
