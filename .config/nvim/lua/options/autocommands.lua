-- alex-laycalvert
-- https://github.com/alex-laycalvert

-- Auto Prettier Format on js/ts file save
--vim.api.nvim_create_autocmd('BufWritePre', {
--    group = vim.api.nvim_create_augroup('AutoPrettierFormat', { clear = true }),
--    pattern = '*.{js,ts,jsx,tsx,json,css,scss,html}',
--    callback = function ()
--        vim.cmd('PrettierAsync')
--    end,
--})