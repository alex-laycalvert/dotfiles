-- plugins/telescope.nvim
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local utils = require('utils')
local telescope = require('telescope')

telescope.setup({
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        file_ignore_patterns = {
            "node_modules/",
        }
    },
    extensions = {
        symbols = {
            sources = {
                'emoji',
                'kaomofi',
                'gitmoji'
            }
        },
        media_files = {
            filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'mp4', 'pdf', 'mkv' },
            find_cmd = 'rg'
        },
        dotfiles = {
        },
        projects = {
            projects_dir = '~/git'
        },
    }
})

telescope.load_extension('media_files')
telescope.load_extension('dotfiles')
telescope.load_extension('projects')

require('octo').setup()

-- keybindings
utils.nmap('<leader>r', 'lua require("telescope.builtin").live_grep()')
utils.nmap('<leader>f', 'lua require("telescope.builtin").find_files()')
utils.nmap('<leader>ff', 'lua require("telescope.builtin").find_files()')
utils.nmap('<leader>fr', 'lua require("telescope.builtin").oldfiles()')
utils.nmap('<leader>fb', 'lua require("telescope.builtin").buffers()')
utils.nmap('<leader>fc', 'lua require("telescope.builtin").commands()')
utils.nmap('<leader>fh', 'lua require("telescope.builtin").search_history()')
utils.nmap('<leader>fm', 'lua require("telescope.builtin").man_pages()')
utils.nmap('<leader>fk', 'lua require("telescope.builtin").marks()')
utils.nmap('<leader>fq', 'lua require("telescope.builtin").quickfix()')
utils.nmap('<leader>fd', 'Telescope dotfiles')
utils.nmap('<leader>fg', 'Telescope projects')
utils.amap('<M-i>', 'Telescope symbols')
