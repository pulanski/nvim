-- Root file for Bootstrapping Neovim plugins
-- and associated plugin configurations
-- (plugins defined within plugins.lua)

local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- All plugins are installed here
lazy.setup("plugins")

-- User-defined plugin configurations
require("user.alpha")
require("user.autocommands")
require("user.autopairs")
require("user.browse")
require("user.bufferline")
require("user.catppuccin")
require("user.cmp")
require("user.codewindow")
require("user.colorful-winsep")
require("user.colorscheme")
require("user.comment")
require("user.compiler-explorer")
require("user.crates")
require("user.copilot")
require("user.cybu")
require("user.due")
require("user.dressing")
require("user.gitsigns")
require("user.glow")
require("user.icon-picker")
require("user.icons")
require("user.indentline")
require("user.jabs")
require("user.keymaps")
require("user.leap")
require("user.lsp")
require("user.lualine")
require("user.material")
require("user.neogen")
require("user.neoscroll")
require("user.notify")
require("user.numb")
require("user.nvim_context_vt")
require("user.nvim-lastplace")
require("user.nvim-tree")
require("user.options")
require("user.overlength")
require("user.range-highlight")
require("user.rust-tools")
require("user.scrollbar")
require("user.symbols-outline")
require("user.telescope")
require("user.test")
require("user.todo-comments")
require("user.transparent")
require("user.treesitter")
require("user.treesitter-context")
require("user.trouble")
require("user.toggleterm")
require("user.whichkey")
