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
        vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = { 'node_modules' },
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        path_display = { 'truncate' },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        mappings = {
            n = { ['q'] = require('telescope.actions').close },
        },
        dynamic_preview_title = true,
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
utils.nmap('<leader>gb', 'Telescope git_branches')
utils.amap('<M-i>', 'Telescope symbols')
