-- local client = vim.lsp.start_client {
--   name = 'dls',
--   cmd = { '/Users/jkersey/Desktop/dev/repos/personal/private/zig/zz/dls/zig-out/bin/dls' },
--   -- on_attach
-- }
--
-- if not client then
--   vim.notify('Could not start dls', vim.log.levels.ERROR)
--   return {}
-- end
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*.duck',
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })

return {}
