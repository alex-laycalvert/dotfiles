local telescope = require('telescope')

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules/",
            ".git/"
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
        }
    }
})

telescope.load_extension('media_files')
