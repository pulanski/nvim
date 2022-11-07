local status_ok, browse = pcall(require, "browse")
if not status_ok then
    return
end

browse.setup({
    provider = "google", -- google, duckduckgo, brave, bing
})

local bookmarks = {
    "https://github.com/rockerBOO/awesome-neovim",
    "https://github.com/alfred-workflows/awesome-alfred-workflows",
    "https://github.com/dhamaniasad/awesome-postgres#readme",
    "https://github.com/shlomi-noach/awesome-mysql#readme",
    "https://github.com/vinjn/awesome-vulkan#readme",
    "https://github.com/hackerkid/bots#readme",
    "https://github.com/ansible-community/awesome-ansible#readme",
    "https://github.com/ChristosChristofidis/awesome-deep-learning#readme",
    "https://github.com/jtoy/awesome-tensorflow#readme",
    "https://news.ycombinator.com/",
}

local function command(name, rhs, opts)
    opts = opts or {}
    vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseInputSearch", function()
    browse.input_search()
end, {})

command("Browse", function()
    browse.browse({ bookmarks = bookmarks })
end, {})

command("BrowseBookmarks", function()
    browse.open_bookmarks({ bookmarks = bookmarks })
end, {})

command("BrowseDevdocsSearch", function()
    browse.devdocs.search()
end, {})

command("BrowseDevdocsFiletypeSearch", function()
    browse.devdocs.search_with_filetype()
end, {})

command("BrowseMdnSearch", function()
    browse.mdn.search()
end, {})
