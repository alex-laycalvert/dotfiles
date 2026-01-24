return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- picker = {
    --   enabled = false,
    --   ui_select = true,
    --   layout = {
    --     reverse = true,
    --     layout = {
    --       box = 'horizontal',
    --       backdrop = false,
    --       width = 0.8,
    --       height = 0.9,
    --       border = 'none',
    --       {
    --         box = 'vertical',
    --         { win = 'list', title = ' Results ', title_pos = 'center', border = 'rounded' },
    --         { win = 'input', height = 1, border = 'rounded', title = '{title} {live} {flags}', title_pos = 'center' },
    --       },
    --       {
    --         win = 'preview',
    --         title = '{preview:Preview}',
    --         width = 0.45,
    --         border = 'rounded',
    --         title_pos = 'center',
    --       },
    --     },
    --   },
    --   sources = {
    --     projects = {
    --       dev = '~/git',
    --       patterns = { '.git' },
    --     },
    --   },
    -- },
    -- explorer = { enabled = true },

    dashboard = {
      preset = {
        -- TODO:
        keys = {},
      },
      -- example = 'github'
      sections = {
        { section = 'header' },
        {
          pane = 2,
          section = 'terminal',
          cmd = 'colorscript -e square',
          height = 5,
          padding = 1,
        },
        { section = 'keys', gap = 1, padding = 1 },
        {
          pane = 2,
          icon = ' ',
          desc = 'Browse Repo',
          padding = 1,
          key = 'b',
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = 'Notifications',
              cmd = 'gh notify -s -n5',
              action = function()
                vim.ui.open 'https://github.com/notifications'
              end,
              key = 'n',
              icon = ' ',
              height = 5,
              enabled = true,
            },
            {
              title = 'Open Issues',
              cmd = 'gh issue list -L 3',
              key = 'i',
              action = function()
                vim.fn.jobstart('gh issue list --web', { detach = true })
              end,
              icon = ' ',
              height = 7,
            },
            {
              icon = ' ',
              title = 'Open PRs',
              cmd = 'gh pr list -L 3',
              key = 'P',
              action = function()
                vim.fn.jobstart('gh pr list --web', { detach = true })
              end,
              height = 7,
            },
            {
              icon = ' ',
              title = 'Git Status',
              cmd = 'git --no-pager diff --stat -B -M -C',
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend('force', {
              pane = 2,
              section = 'terminal',
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = 'startup' },
      },
    },
  },
  keys = {
    -- {
    --   '<leader>o',
    --   function()
    --     Snacks.picker.files()
    --   end,
    --   desc = '[S]earch [F]iles',
    -- },
    -- {
    --   '<leader>sp',
    --   function()
    --     Snacks.picker.projects()
    --   end,
    --   desc = '[S]earch [P]rojects',
    -- },
  },
}
