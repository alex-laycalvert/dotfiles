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
