local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
    return
end

-- using tokyonight.nvim colors
local colors = require("tokyonight.colors").setup()

require("scrollbar.handlers.search").setup()

scrollbar.setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    },
})

-- Xuyuanp/scrollbar.nvim config

-- Autocommand for showing scrollbar on startup

-- vim.cmd [[
-- augroup ScrollbarInit
--   autocmd!
--   autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
--   autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
--   autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
-- augroup end
-- ]]
