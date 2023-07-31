vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'MunifTanjim/nui.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    config = function()
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
              ['.'] = 'toggle_hidden',
              ['F'] = 'clear_filter',
            }
          }
        },
        sources = {
          'filesystem',
          'buffers',
          'git_status',
          'document_symbols'
        },
        source_selector = {
          winbar = true,
          statusline = false,
          sources = {
            { source = 'filesystem' },
            { source = 'document_symbols' },
            { source = 'buffers' },
            { source = 'git_status' },
          }
        }
      })
    end
  },

  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
    end,
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  'prettier/vim-prettier',

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup()
    end,
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = { options = {} }
  },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  --{
  --  'edluffy/hologram.nvim',
  --  config = function()
  --    require('hologram').setup {
  --      auto_display = true
  --    }
  --  end
  --},

  'alex-laycalvert/telescope-projects.nvim',
  'alex-laycalvert/telescope-dotfiles.nvim',
  'nvim-telescope/telescope-media-files.nvim',
}, {})

-- [[ Setting options ]]
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.tabstop = 4

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { silent = true, desc = 'Save File' })
vim.keymap.set('n', '<leader>W', '<cmd>wall<cr>', { silent = true, desc = 'Save All Open Files' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { silent = true, desc = 'Close File' })
vim.keymap.set('n', '<leader>Q', '<cmd>qall<cr>', { silent = true, desc = 'Close Neovim' })
vim.keymap.set('n', '<leader>l', '<cmd>luafile %<cr>', { desc = '[L]oad Lua File' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-return>', '<cmd>term<cr><cmd>startinsert<cr>', { desc = 'Open Terminal' })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { desc = "Escape Terminal Mode" })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-t>', '<cmd>tabnew<cr>', { desc = 'Open New Tab' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-w>', '<cmd>tabclose<cr>', { desc = 'Close Current Tab' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-Tab>', '<cmd>tabnext<cr>', { desc = 'Goto Next Tab' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-S-Tab>', '<cmd>tabprevious<cr>', { desc = 'Goto Previous Tab' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-M-h>', '<cmd>-tabmove<cr>', { desc = 'Move Current Tab to Left' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-M-l>', '<cmd>+tabmove<cr>', { desc = 'Move Current Tab to Right' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-h>', '<cmd>wincmd h<cr>', { desc = 'Move to Left Window' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-j>', '<cmd>wincmd j<cr>', { desc = 'Move to Below Window' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-k>', '<cmd>wincmd k<cr>', { desc = 'Move to Above Window' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-l>', '<cmd>wincmd l<cr>', { desc = 'Move to Right Window' })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-v>', '<cmd>vsplit<cr>', { desc = 'Vertical Split' })
vim.keymap.set({ 'n', 'i', 'v' }, '<M-s>', '<cmd>split<cr>', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader><Tab>', '<cmd>Neotree toggle<cr>', { desc = 'Open File Tree Tab' })
vim.keymap.set('n', '<leader>b', '<cmd>Neotree source=buffers toggle<cr>', { desc = 'Open Buffer Tree Tab' })
vim.keymap.set('n', '<leader>r', function() require('ranger-nvim').open() end, { desc = 'Open File Tree Tab' })
vim.keymap.set({ 'n', 'i', 'v' }, '<M-S-n>', function() require('todo-comments').jump_next() end,
  { desc = "Goto Next TODO" })
vim.keymap.set({ 'n', 'i', 'v' }, '<M-S-p>', function() require('todo-comments').jump_prev() end,
  { desc = "Goto Previous TODO" })
vim.keymap.set('n', '<leader>t', '<cmd>TodoLocList<cr>', { desc = "Open TODO List" })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    projects = {
      projects_dir = '~/git'
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
      find_cmd = "rg"
    },
  }
}

-- Telescope extensions
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'dotfiles')
pcall(require('telescope').load_extension, 'projects')
pcall(require('telescope').load_extension, 'media_files')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>o', require('telescope.builtin').find_files, { desc = '[O]pen File' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope dotfiles<cr>', { desc = '[S]earch [C]onfig' })
vim.keymap.set('n', '<leader>sp', '<cmd>Telescope projects<cr>', { desc = '[S]earch [P]rojects' })
vim.keymap.set('n', '<leader>sm', '<cmd>Telescope media_files<cr>', { desc = '[S]earch [M]edia Files' })

-- [[ Configure Treesitter ]]
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-s>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set({ 'n', 'i' }, '<M-p>', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set({ 'n', 'i' }, '<M-n>', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<M-d>', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<M-S-d>', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local format = function()
    local file_type = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    if file_type == 'javascript' or
        file_type == 'typescript' or
        file_type == 'javascriptreact' or
        file_type == 'typescriptreact' or
        file_type == 'json' or
        file_type == 'css' or
        file_type == 'scss' or
        file_type == 'sass' or
        file_type == 'markdown' or
        file_type == 'html' then
      vim.cmd('Prettier')
    else
      vim.lsp.buf.format()
    end
  end

  nmap('<M-r>', vim.lsp.buf.rename, '[R]ename')
  nmap('<M-a>', vim.lsp.buf.code_action, 'Code [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ps', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>pa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
  nmap('<leader>pr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
  nmap('<leader>pl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Workspace List Folders')

  -- Create a command `:format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('<M-f>', ':Format<cr>', 'Format File')
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  eslint = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-;>'] = cmp.mapping.complete {},
    ['<C-;>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-k>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-j>'] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
