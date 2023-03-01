local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local colors = {
    red = "#ca1243",
    grey = "#a0a1a7",
    dark_grey = "#333543",
    blue = "#4063D8",
    black = "#383a42",
    white = "#f3f3f3",
    light_green = "#389826",
    orange = "#fe8019",
    green = "#28592C",
    magenta = "#9558B2",
    light_blue = "#6271A4",
    yellow = "#ffba00",
}

local theme = {
    normal = {
        a = { fg = colors.white, bg = colors.light_blue },
        b = { fg = colors.white, bg = colors.dark_grey },
        c = { fg = colors.white, bg = colors.dark_grey },
        z = { fg = colors.white, bg = colors.light_blue },
    },
    insert = { a = { fg = colors.black, bg = colors.light_green } },
    visual = { a = { fg = colors.black, bg = colors.magenta } },
    replace = { a = { fg = colors.black, bg = colors.green } },
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    diagnostics_color = { warn = { bg = colors.dark_grey, fg = colors.yellow } },
    always_visible = true,
}

local diff = {
    "diff",
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    -- configuring diff symbols colors
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    icons_enabled = true,
}

local location = {
    "location",
    padding = 0,
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { diagnostics },
        lualine_x = { diff, spaces, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { "progress" },
    },
})
