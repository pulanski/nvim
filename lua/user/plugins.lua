local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- All plugins are installed here
return packer.startup(function(use)
    ---------------------
    -- Plugin Mangager --
    ---------------------

    -- Have packer manage itself
    use "wbthomason/packer.nvim"

    ---------------------
    -- Lua Development --
    ---------------------

    -- Useful lua functions used by lots of plugins
    use "nvim-lua/plenary.nvim"

    -- Popup API for neovim (WIP)
    use "nvim-lua/popup.nvim"

    --------------
    -- Comments --
    --------------

    -- Comments
    use "numToStr/Comment.nvim"

    -- TODO comments
    use "folke/todo-comments.nvim"

    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"

    -- Nvim opening dashboard
    use "goolord/alpha-nvim"

    -- Terminal usage in neovim
    use "akinsho/toggleterm.nvim"

    -- Google Keep usage in Neovim
    use { "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" }

    -- lightbulb for nvim's builtin lsp
    use "antoinemadec/FixCursorHold.nvim"
    use {
        "kosayoda/nvim-lightbulb",
        requires = "antoinemadec/FixCursorHold.nvim",
    }

    use "Xuyuanp/scrollbar.nvim"

    use "kevinhwang91/promise-async"
    -- code folding (e.g. hiding function details or boilerplate code from
    -- current editor context)
    use "kevinhwang91/nvim-ufo"

    -- pasting of images into neovim
    use "ekickx/clipboard-image.nvim"

    -- allows for the toggling of transparent backgrounds
    use "xiyaowong/nvim-transparent"

    -- vim.ui improvements
    use "stevearc/dressing.nvim"

    -- emoji/icon picker
    use "ziontee113/icon-picker.nvim"

    ------------------
    -- Colorschemes --
    ------------------

    use "folke/tokyonight.nvim"
    use "lunarvim/darkplus.nvim"
    use "savq/melange"
    use "ellisonleao/gruvbox.nvim"
    use "bluz71/vim-moonfly-colors"
    use "catppuccin/nvim"
    use "shaeinst/roshnivim-cs"
    use "rafamadriz/neon"
    use "sainnhe/sonokai"
    use "mhartington/oceanic-next"
    use "glepnir/zephyr-nvim"
    use "tjdevries/colorbuddy.vim"
    use "Th3Whit3Wolf/onebuddy"
    use "ray-x/aurora"
    use "marko-cerovac/material.nvim"
    use "ray-x/starry.nvim"
    use "rktjmp/lush.nvim"
    use "RishabhRD/gruvy"
    use "rockyzhang24/arctic.nvim"

    -------------------------
    -- Syntax / Treesitter --
    -------------------------

    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-context"

    -- Autoclose tags for Svelte, JS/JSX/TS/TSX, Vue, etc.
    use "windwp/nvim-ts-autotag"

    -- Surround selections with delimiter pairs (e.g. `()` or `{}`)
    use "kylechui/nvim-surround"

    use {
        "sudormrfbin/cheatsheet.nvim",
        requires = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
    }

    ------------------------
    -- Editor Enhancement --
    ------------------------

    -- Autopairs, integrates with both cmp and treesitter
    use "windwp/nvim-autopairs"

    -- Highlights trailing whitespace
    use "ntpeters/vim-better-whitespace"

    -- peeks lines of the buffer in non-obtrusive way.
    -- (e.g. :35 will preview or peek line 35 without jumping and can be cancelled)
    use "nacro90/numb.nvim"

    -- Zen Mode
    use "folke/zen-mode.nvim"

    ---------------------------
    -- Keybindings / Keymaps --
    ---------------------------

    -- Whichkey
    use "folke/which-key.nvim"

    -- Markdown / LaTeX
    use "davidgranstrom/nvim-markdown-preview"
    use "ellisonleao/glow.nvim"

    -- snippets
    --snippet engine
    use "L3MON4D3/LuaSnip"
    -- a bunch of snippets to use
    use "rafamadriz/friendly-snippets"

    ---------
    -- LSP --
    ---------

    -- Enable LSP
    use "neovim/nvim-lspconfig"

    -- Package Manager for Neovim (LSP servers, DAP servers, linters, and formatters)
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- For formatters and linters
    use "jose-elias-alvarez/null-ls.nvim"

    use "ray-x/lsp_signature.nvim"
    use "RRethy/vim-illuminate"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    -- tree-like view for symbols in neovim using the lsp
    use "simrat39/symbols-outline.nvim"
    -- alternative lsp implementation
    -- use "glepnir/lspsaga.nvim"

    -----------------
    -- Completions --
    -----------------

    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"
    -- use {
    --  "zbirenbaum/copilot-cmp",
    --  module = "copilot-cmp",
    -- }

    ---------------------------
    -- Programming Languages --
    ---------------------------

    use "simrat39/rust-tools.nvim"

    -- Compiler Explorer
    use "krady21/compiler-explorer.nvim"

    -----------
    -- Games --
    -----------

    -- Tetris
    use "alec-gibson/nvim-tetris"
    -- Minesweeper
    use "seandewar/nvimesweeper"
    -- Killersheep
    use "seandewar/killersheep.nvim"

    -- Due.nvim
    use "NFrid/due.nvim"

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- Notifications Manager
    use "rcarriga/nvim-notify"
    use "kevinhwang91/nvim-hlslens"
    -- Enhanced highlighting during search
    use "rktjmp/highlight-current-n.nvim"
    -- Highlighting utility
    use "winston0410/range-highlight.nvim"
    -- Highlights parts of line over current textwidth
    use "lcheylus/overlength.nvim"

    -- Cycle buffers with a simple UI
    use "ghillb/cybu.nvim"

    -- <leader>s open spotify tui (spotify-tui)
    -- <leader>k open kubernetes tui (k9s)

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
    }

    -- Bazel dependency
    use "google/vim-maktaba"
    -- Execute bazel commands from within neovim
    use "bazelbuild/vim-bazel"

    -- mkdir.nvim
    use "jghauser/mkdir.nvim"

    ---------
    -- Git --
    ---------

    use "lewis6991/gitsigns.nvim"
    use "f-person/git-blame.nvim"
    use "ruifm/gitlinker.nvim"
    use "mattn/vim-gist"
    use "mattn/webapi-vim"

    ------------
    -- GitHub --
    ------------

    use {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
    }

    -- DAP
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "ravenxrz/DAPInstall.nvim"

    -- Copilot
    -- use "github/copilot.vim"

    -- use {
    --  "zbirenbaum/copilot.lua",
    --  event = { "VimEnter" },
    --  config = function ()
    --   vim.defer_fn(function ()
    --      require("user.copilot")
    --    end, 1000)
    --  end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
