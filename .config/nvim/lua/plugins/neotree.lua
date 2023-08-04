-- alex-laycalvert
-- https://github.com/alex-laycalvert

require('neo-tree').setup({
    close_if_last_window = false,
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        window = {
            mappings = {
                ['u'] = 'navigate_up',
                ['U'] = 'set_root',
                ['.'] = 'toggle_hidden'
            }
        }
    },
})
