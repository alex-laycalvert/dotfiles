-- plugins/dashboard.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local home = os.getenv('HOME')
local db = require('dashboard')

db.custom_center = {
    {
        desc = 'Hey, there'
    }
    -- {
    --     icon = '   ',
    --     desc = 'Recently latest session                  ',
    --     shortcut = 'SPC s l',
    --     action ='SessionLoad'
    -- },
   -- {
    --     icon = '  ',
    --     desc = 'Recently opened files                   ',
    --     action =  'DashboardFindHistory',
    --     shortcut = 'SPC f h'
    -- },
    -- {
    --     icon = '  ',
    --     desc = 'Find  word                              ',
    --     action = 'Telescope live_grep',
    --     shortcut = 'SPC f w'
    -- },
    -- {
    --     icon = '  ',
    --     desc = 'Open Personal dotfiles                  ',
    --     action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
    --     shortcut = 'SPC f d'
    -- },
}

db.custom_header = {
'                                                       ',
'                                                       ',
'                                                       ',
'                                                       ',
'                                                       ',
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
'                                                       ',
'                                                       ',
'                                                       ',
'                                                       ',
'                                                       ',
}
