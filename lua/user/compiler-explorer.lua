local status_ok, compiler_explorer = pcall(require, "compiler-explorer")
if not status_ok then
    return
end

compiler_explorer.setup {
    url = "https://godbolt.org",
    open_qflist = false, -- Open qflist after compile.
    infer_lang = true, -- Try to infer possible language based on file extension.
    binary_hl = "Comment", -- Highlight group for binary extmarks/virtual text.
    autocmd = {
        enable = false, -- Enable assembly to source and source to assembly highlighting.
        hl = "Cursorline", -- Highlight group used for line match highlighting.
    },
    diagnostics = { -- vim.diagnostic.config() options for the ce-diagnostics namespace.
        underline = false,
        virtual_text = false,
        signs = false,
    },
    split = "split", -- How to split the window after the second compile (split/vsplit).
    spinner_frames = { "⣼", "⣹", "⢻", "⠿", "⡟", "⣏", "⣧", "⣶" }, -- Compiling... spinner settings.
    spinner_interval = 100,
}
