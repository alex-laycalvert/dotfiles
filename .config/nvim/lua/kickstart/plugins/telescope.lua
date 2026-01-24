return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    { 'alex-laycalvert/telescope-projects.nvim' },
    { 'alex-laycalvert/telescope-dotfiles.nvim' },
    { 'alex-laycalvert/telescope-restartlsp.nvim' },
    { 'Snikimonkd/telescope-git-conflicts.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'

    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      pickers = {
        find_files = {
          follow = true,
          no_ignore = true,
          hidden = true,
          find_command = {
            'rg',
            '--files',
            '--color',
            'never',
            '-g',
            '!**/node_modules/**',
            '-g',
            '!**/venv/**',
            '-g',
            '!**/__pycache__/**',
            '-g',
            '!**/dist/**',
            '-g',
            '!**/.next/**',
            '-g',
            '!.git/**',
          },
        },
        live_grep = {
          additional_args = function()
            return {
              '--hidden',
              '-g',
              '!**/node_modules/**',
              '-g',
              '!**/venv/**',
              '-g',
              '!**/__pycache__/**',
              '-g',
              '!**/dist/**',
              '-g',
              '!**/.next/**',
              '-g',
              '!.git/**',
            }
          end,
        },
        git_branches = {
          mappings = {
            i = { ['<cr>'] = actions.git_switch_branch },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        projects = {
          projects_dir = '~/git',
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'dotfiles')
    pcall(require('telescope').load_extension, 'projects')
    pcall(require('telescope').load_extension, 'conflicts')
    pcall(require('telescope').load_extension, 'restartlsp')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>o', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.live_grep, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sgc', '<cmd>Telescope conflicts<cr>', { desc = '[S]earch [G]it [C]onflicts' })
    vim.keymap.set('n', '<leader>sgb', builtin.git_branches, { desc = '[S]earch [G]it [B]onflicts' })
    vim.keymap.set('n', '<leader>sc', '<cmd>Telescope dotfiles<cr>', { desc = '[S]earch [C]onfig' })
    vim.keymap.set('n', '<leader>sp', '<cmd>Telescope projects<cr>', { desc = '[S]earch [P]rojects' })
    vim.keymap.set('n', '<leader>lr', '<cmd>Telescope restartlsp<cr>', { desc = '[L]SP [R]estart' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
