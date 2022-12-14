local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]] -- red
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]] -- yellow
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]] --
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.cmd [[highlight IndentBlanklineIndent7 guibg=#34363D gui=nocombine]] -- dark yellow
vim.cmd [[highlight IndentBlanklineIndent8 guibg=#2B3640 gui=nocombine]] -- teal
-- vim.cmd [[highlight IndentBlanklineIndent9 guibg=#1b1b1b gui=nocombine]] -- dark green

indent_blankline.setup {
    char = "▏",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent8",
    },
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
    },
}
