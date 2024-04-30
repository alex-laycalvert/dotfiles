local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local same = function(index)
	return f(function(arg)
		return arg[1]
	end, { index })
end

local filename = function()
	return f(function()
		local fname = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
		return fname:match("(.+)%..+$")
	end, {})
end

ls.add_snippets("typescript", {
	s(
		"epmodel",
		fmt(
			[[
            import mongoose from 'mongoose'

            const {} = new mongoose.Schema({{
                {}
            }})

            export const {} = mongoose.model<EP.{}>('{}', {})

            {}
        ]],
			{ i(1, "schema"), i(2), filename(), filename(), filename(), same(1), i(0) }
		)
	),
	s(
		"afn",
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
	s("filename", fmt([[{}]], { filename() })),
})
