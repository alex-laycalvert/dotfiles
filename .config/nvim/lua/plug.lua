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

    -- dashboard 
    use { 'glepnir/dashboard-nvim' }

    -- organization
    use { 'nvim-orgmode/orgmode' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use { 'nvim-lua/plenary.nvim' }

    -- tree-sitter
    use { 'nvim-treesitter/nvim-treesitter', run =  ':TSUpdate' }

    -- snippets
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }

    -- colortheme
    use { 'dracula/vim' }

    -- filetree
    use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }

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
    use { 'pwntester/octo.nvim' }

    -- telescope (fzf)
    use { 'nvim-telescope/telescope.nvim' }
    -- use { 'nvim-telescope/telescope-project.nvim' }
    -- use { 'cljoly/telescope-repo.nvim' }

    -- auto docs
    use { 'kkoomen/vim-doge' }

    -- web dev
    use { 'ray-x/web-tools.nvim' }
    use { 'NTBBloodbath/rest.nvim' }

    -- sniprun
    use { 'michaelb/sniprun', run = 'bash install.sh' }

    --- CUSTOM PLUGINS ---
    -- flashcards IN PROGRESS
    use { '~/git/flashcards.nvim' }
end)

require('nvim_comment').setup({
    comment_empty = false,
    operator_mapping = '<M-/>',
})
require('lualine').setup()
require('octo').setup()
require('rest-nvim').setup({
    result_split_horizontal = false,
    result_split_in_place = false,
    skip_ssl_verification = true,
    encode_url = true,
    highlight = {
        enabled = true,
        timeout = 150
    },
    result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
            json = 'jq',
            html = function (body)
                return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
            end
        }
    },
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true
})
require('sniprun').setup({
    display = {
        "VirtualTextOk",
        "VirtualTextErr",
        "TempFloatingWindow"
    }
})
require('flashcards').setup({})
