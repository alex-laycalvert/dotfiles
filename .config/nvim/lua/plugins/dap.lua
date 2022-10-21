-- plugins/dap.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local dap = require('dap')
local utils = require('utils')

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.cpp = {{
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function ()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {'r', 'h'},
    env = function ()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
    end,
}}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- keybindings
utils.nmap('<leader>db', 'lua require("dap").toggle_breakpoint()')
utils.nmap('<leader>dc', 'lua require("dap").continue()')
utils.nmap('<leader>do', 'lua require("dap").step_over()')
utils.nmap('<leader>di', 'lua require("dap").step_into()')
utils.nmap('<leader>dr', 'lua require("dap").repl.open()')
