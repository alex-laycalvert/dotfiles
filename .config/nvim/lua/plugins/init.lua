-- plugins/init.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local utils = require('utils')

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup({
    function(use)
        -- plugin manager
        use { 'wbthomason/packer.nvim' }

        -- dashboard 
        use { 'glepnir/dashboard-nvim' }

        -- lsp
        use { 'neovim/nvim-lspconfig' }

        -- nvim-cmp
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-cmdline' }
        use {
            'tzachar/cmp-tabnine',
            run = './install.sh',
            requires = 'hrsh7th/nvim-cmp'
        }
        use { 'hrsh7th/cmp-nvim-lua' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'hrsh7th/nvim-cmp' }

        -- tree-sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run =  ':TSUpdate',
        }

        -- organization/neorg
        -- use {
        --     'nvim-neorg/neorg',
        --     tag = '*',
        --     run = ':Neorg sync-parsers',
        --     after = { 'nvim-treesitter', 'telescope.nvim' },
        --     requires = 'nvim-lua/plenary.nvim',
        -- }
        use { 'renerocksai/calendar-vim' }
        use { 'renerocksai/telekasten.nvim' }
        -- use { 'tools-life/taskwiki' }

        -- snippets
        use { 'hrsh7th/cmp-vsnip' }
        use { 'hrsh7th/vim-vsnip' }

        -- colorscheme
        use { 'dracula/vim' }

        -- filetree
        use {
            'ms-jpq/chadtree',
            branch = 'chad',
            run = 'python3 -m chadtree deps',
        }

        -- commentor
        use { 'terrortylor/nvim-comment' }

        -- status line
        use { 'nvim-lualine/lualine.nvim' }

        -- math symbols
        use { 'jbyuki/nabla.nvim' }

        -- icons
        use { 'kyazdani42/nvim-web-devicons' }

        -- git
        use { 'kdheepak/lazygit.nvim' }

        -- telescope (fzf)
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-telescope/telescope-media-files.nvim' }
        use { 'nvim-telescope/telescope-symbols.nvim' }
        use { 'pwntester/octo.nvim' }
        use { 'nvim-telescope/telescope.nvim' }

        -- auto docs
        use { 'kkoomen/vim-doge' }

        -- diagrams
        use { 'jbyuki/venn.nvim' }

        -- web dev
        use { 'ray-x/web-tools.nvim' }
        use {
            'NTBBloodbath/rest.nvim',
        }

        -- sniprun
        use {
            'michaelb/sniprun',
            run = 'bash install.sh',
        }

        --- CUSTOM PLUGINS ---
        use { 'alex-laycalvert/flashcards.nvim' }
        use { 'alex-laycalvert/sudoku.nvim' }
        use { '~/git/telescope-dotfiles.nvim' }
        use { '~/git/telescope-projects.nvim' }
        use { '~/git/life.nvim' }
    end,
    config = {
        display = {
            open_fn = function()
              return require('packer.util').float({ border = 'single' })
            end
        }
    }
})

-- plugin setup
require('plugins.lspconfig')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.telekasten')
-- require('plugins.neorg')
-- require('plugins.taskwiki')
require('plugins.dashboard')
require('plugins.telescope')
require('plugins.chadtree')
require('plugins.sniprun')
require('plugins.comment')
require('plugins.lazygit')
require('plugins.diagram')
require('plugins.rest')
require('plugins.statusline')

require('flashcards').setup({})

-- keybindings
utils.nmap('<leader>p', 'PackerUpdate')
