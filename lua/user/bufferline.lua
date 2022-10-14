local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        themeable = true, -- whether or not the highlights for this plugin can be overriden.

        -- For ⁸·₂
        numbers = function(opts)
            return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions" buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        diagnostics = "nvim_lsp",
        groups = {
            options = {
                toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
            },
            items = {
                {
                    name = "Tests", -- Mandatory
                    highlight = { underline = true, sp = "blue" }, -- Optional
                    priority = 2, -- determines where it will appear relative to other groups (Optional)
                    icon = "", -- Optional
                    matcher = function(buf) -- Mandatory
                        return buf.filename:match "%_test" or buf.filename:match "%_spec"
                    end,
                },
                {
                    name = "Docs",
                    highlight = { undercurl = true, sp = "green" },
                    auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
                    matcher = function(buf)
                        return buf.filename:match "%.md" or buf.filename:match "%.txt"
                    end,
                    separator = { -- Optional
                        style = require("bufferline.groups").separator.tab,
                    },
                },
            },
        },
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
    highlights = {
        fill = {
            -- fg = "o",
            bg = "#212125",
        },
        background = {
            -- fg = "TabLine",
            -- bg = "TabLine",
        },
        buffer_visible = {
            -- fg = "TabLine",
            -- bg = "TabLine",
        },
        --
        -- close_button = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        -- },
        -- close_button_visible = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        -- },
        --
        tab_selected = {
            -- fg = "Normal",
            -- bg = "Normal",
        },
        -- tab = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        -- },
        -- tab_close = {
        --     guifg = { attribute = "fg", highlight = "TabLineSel" },
        --     guibg = { attribute = "bg", highlight = "Normal" },
        -- },
        --
        -- duplicate_selected = {
        --     guifg = { attribute = "fg", highlight = "TabLineSel" },
        --     guibg = { attribute = "bg", highlight = "TabLineSel" },
        --     gui = "italic",
        -- },
        -- duplicate_visible = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        --     gui = "italic",
        -- },
        -- duplicate = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        --     gui = "italic",
        -- },
        --
        -- modified = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        -- },
        -- modified_selected = {
        --     guifg = { attribute = "fg", highlight = "Normal" },
        --     guibg = { attribute = "bg", highlight = "Normal" },
        -- },
        -- modified_visible = {
        --     guifg = { attribute = "fg", highlight = "TabLine" },
        --     guibg = { attribute = "bg", highlight = "TabLine" },
        -- },
        --
        -- -- separator = {
        -- --     guifg = { attribute = "bg", highlight = "TabLine" },
        -- --     guibg = { attribute = "bg", highlight = "TabLine" },
        -- -- },
        -- separator_selected = {
        --     guifg = { attribute = "bg", highlight = "Normal" },
        --     guibg = { attribute = "bg", highlight = "Normal" },
        -- },
        -- -- indicator_selected = {
        -- --     guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
        -- --     guibg = { attribute = "bg", highlight = "Normal" },
        -- -- },
    },
}
