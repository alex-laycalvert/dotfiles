-- plugins/telekasten.lua
-- alex-laycalvert
-- 
-- https://github.com/alex-laycalvert

local utils = require('utils')

local api = vim.api
local notes_dir = vim.fn.expand('~/git/notebook')

require('telekasten').setup({
    home = notes_dir,
    take_over_my_home = true,
    auto_set_filetype = true,
    dailies = notes_dir .. '/' .. 'daily',
    weeklies = notes_dir .. '/' .. 'weekly',
    templates = notes_dir .. '/' .. 'templates',
    image_subdir = 'img',
    extension = '.md',
    new_note_filename = 'title',
    uuid_type = '%Y%m%d%H%M',
    uuid_sep = '-',
    follow_creates_nonexisting = true,
    dailies_creates_nonexisting = true,
    weeklies_creates_nonexisting = true,
    journal_auto_open = false,
    template_new_note = notes_dir .. '/' .. 'templates/new_note.md',
    template_new_daily = notes_dir .. '/' .. 'templates/daily.md',
    template_new_weekly= notes_dir .. '/' .. 'templates/weekly.md',
    image_link_style = 'markdown',
    sort = 'filename',
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 1,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = '#tag',

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = 'dropdown',

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = 'dropdown',

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = 'smart',

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = 'smart',

    -- should all links be updated when a file is renamed
    rename_update_links = true,

    -- how to preview media files
    -- 'telescope-media-files' if you have telescope-media-files.nvim installed
    -- 'catimg-previewer' if you have catimg installed
    media_previewer = 'telescope-media-files',
})

api.nvim_set_hl(0, 'tkLink', { ctermfg = 72, fg = '#689d6a', bold = true, underline = true })
api.nvim_set_hl(0, 'tkBrackets', { ctermfg = 'gray', fg = 'gray' })
api.nvim_set_hl(0, 'tkHighlight', { ctermbg = 'yellow', ctermfg = 'darkred', bold = true, bg = 'yellow', fg = 'darkred' })
api.nvim_set_hl(0, 'tkTagSep', { ctermfg = 'gray', fg = 'gray' })
api.nvim_set_hl(0, 'tkTag', { ctermfg = 175, fg = '#D3869B' })
vim.cmd('hi link CalNavi CalRuler')

-- keybinings
utils.nmap('<leader>o', 'lua require("telekasten").panel()')
utils.nmap('<leader>oo', 'lua require("telekasten").find_notes()')
utils.nmap('<leader>os', 'lua require("telekasten").search_notes()')
utils.nmap('<leader>of', 'lua require("telekasten").follow_link()')
utils.nmap('<leader>od', 'lua require("telekasten").goto_today()')
utils.nmap('<leader>ow', 'lua require("telekasten").goto_thisweek()')
utils.nmap('<leader>oD', 'lua require("telekasten").find_daily_notes()')
utils.nmap('<leader>oW', 'lua require("telekasten").find_weekly_notes()')
utils.nmap('<leader>oc', 'lua require("telekasten").show_calendar()')
utils.nmap('<leader>oC', 'CalendarT')
utils.nmap('<leader>ol', 'lua require("telekasten").insert_link()')
utils.nmap('<leader>oL', 'lua require("telekasten").insert_img_link({ i = true })')
utils.nmap('<leader>oi', 'lua require("telekasten").preview_img()')
utils.nmap('<leader>oI', 'lua require("telekasten").paste_img_and_link()')
utils.nmap('<leader>ob', 'lua require("telekasten").show_backlinks()')
utils.nmap('<leader>oF', 'lua require("telekasten").find_friends()')
utils.nmap('<leader>om', 'lua require("telekasten").browse_media()')
utils.nmap('<leader>on', 'lua require("telekasten").new_note()')
utils.nmap('<leader>oN', 'lua require("telekasten").new_templated_note()')
utils.nmap('<leader>ot', 'lua require("telekasten").toggle_todo()')
utils.map('v', '<leader>ot', ':Telekasten toggle_todo<CR>')
utils.nmap('<leader>oy', 'lua require("telekasten").yank_notelink()')
utils.nmap('<leader>or', 'lua require("telekasten").rename_note()')
utils.nmap('<leader>oT', 'lua require("telekasten").show_tags()')
