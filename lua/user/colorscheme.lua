-- local colorscheme = "catppuccin"
-- local colorscheme = "dracula"
local colorscheme = "earlysummer"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    return
end
