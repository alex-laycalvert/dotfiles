-- .config/nvim/setup/init.lua
-- alex-laycalvert
--
-- https://github.com/alex-laycalvert

local setup = {}

function setup.setup()
    require('plug').setup()
    require('lsp').setup()
    require('opt').setup()
    require('keys').setup()
    require('auto').setup()
end

return setup
