-- plugins/neorg.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

return require('neorg').setup({
    load = {
        ['core.defaults'] = {},
        ['core.syntax'] = {},
        ['core.integrations.treesitter'] = {},
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    agenda = '~/git/notebook/agenda',
                    journal = '~/git/notebook/journal',
                    work = '~/git/notebook/work',
                    school = '~/git/notebook/school',
                }
            }
        },
        -- ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-cmp'
            }
        },
        ['core.gtd.base'] = {
            config = {
                workspace = 'agenda'
            }
        },
        ['core.presenter'] = {
            config = {
                zen_mode = 'zen-mode'
            }
        },
        ['core.norg.journal'] = {
            config = {
                workspace = 'journal'
            }
        },
        ['core.norg.qol.toc'] = {},
    },
    logger = {
        level = 'warn'
    }
})
