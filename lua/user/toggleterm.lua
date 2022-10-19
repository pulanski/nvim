local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    size = 8,
    -- move keymap to main keymaps
    -- open_mapping = [[<leader>tt]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
    },
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

-- create a new terminal with lazydocker

local lazydocker = Terminal:new { cmd = "lazydocker", hidden = true, direction = "float" }

function _LAZYDOCKER_TOGGLE()
    lazydocker:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>dk", "<cmd>lua _LAZYDOCKER_TOGGLE()<CR>", { noremap = true, silent = true })

-- create a new terminal with the specified command `bt`,
-- a shorthand alias for sequentially running `bazel build //...`
-- followed by `bazel test //...`
local bazel_build_test = Terminal.new { cmd = "'bazel build ...'", hidden = true }

function _BAZEL_BUILD_TEST()
    bazel_build_test:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>bt", "<cmd>lua _BAZEL_BUILD_TEST()<CR>", { noremap = true, silent = true })
