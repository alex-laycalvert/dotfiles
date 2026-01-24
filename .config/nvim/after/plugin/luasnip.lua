local ls = require 'luasnip'

ls.add_snippets('typescript', dofile(vim.fn.stdpath 'config' .. '/after/plugin/snippets/typescript.lua'))
ls.add_snippets('markdown', dofile(vim.fn.stdpath 'config' .. '/after/plugin/snippets/markdown.lua'))
