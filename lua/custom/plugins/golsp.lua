-- local client = vim.lsp.start_client {
--   name = 'golsp',
--   cmd = { '/Users/jkersey/Desktop/dev/repos/personal/private/go/lsp/main' },
--   -- on_attach
-- }
--
-- if not client then
--   vim.notify('Could not start golsp', vim.log.levels.ERROR)
--   return {}
-- end
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   -- pattern = '*.duck',
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })

return {}
