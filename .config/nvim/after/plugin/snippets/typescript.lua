local ls = require 'luasnip'
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node

local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end

local filename = function()
  return f(function()
    local fname = vim.fn.fnamemodify(vim.fn.expand '%', ':t')
    return fname:match '(.+)%..+$'
  end, {})
end

return {
  s(
    'epmodel',
    fmt(
      [[
            import mongoose from 'mongoose'

            const {} = new mongoose.Schema({{
                {}
            }})

            export const {} = mongoose.model<EP.{}>('{}', {})

            {}
        ]],
      { i(1, 'schema'), i(2), filename(), filename(), filename(), same(1), i(0) }
    )
  ),

  s(
    'afn',
    fmt(
      [[
            async function {}({}){} {{
                {}
            }}

            {}
        ]],
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),

  s('filename', fmt([[{}]], { filename() })),

  s(
    'try',
    fmt(
      [[
          try {{
              {}
          }} catch(e) {{
              {}
          }}
    {}
        ]],
      { i(1), i(2), i(0) }
    )
  ),
}
