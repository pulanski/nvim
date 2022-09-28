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

return packer.startup(function(use)
    -- Have packer manage itself
    use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }
    -- Useful lua functions used by lots of plugins
    use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }
    -- Autopairs, integrates with both cmp and treesitter
    use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }
    use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }
    use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
    use { "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }
    use { "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }
    use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
    use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }
    use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
    use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
    use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
    use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }

    -- peeks lines of the buffer in non-obtrusive way.
    -- (e.g. :35 will preview or peek line 35 without jumping and can be cancelled)
    use { "nacro90/numb.nvim" }

    use { "simrat39/symbols-outline.nvim" }

    ------------------
    -- Colorschemes --
    ------------------

    use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
    use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
    use { "savq/melange", commit = "78af754ad22828ea3558e2990326b8aa39730918" }
    use { "ellisonleao/gruvbox.nvim" }
    use { "bluz71/vim-moonfly-colors" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
    use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
    use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    -- use {
    --  "zbirenbaum/copilot-cmp",
    --  module = "copilot-cmp",
    -- }

    -- whichkey
    use { "folke/which-key.nvim" }

    -- Markdown / LaTeX
    use { "davidgranstrom/nvim-markdown-preview", commit = "3d6f941beb223b23122973d077522e9e2ee33068" }
    use { "ellisonleao/glow.nvim", commit = "b6b997277e019f751031ea52f9571ad2e1e7e42d" }

    -- snippets
    --snippet engine
    use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }
    -- a bunch of snippets to use
    use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }

    -- LSP
    -- enable LSP
    use { "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }
    -- simple to use language server installer
    use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }
    -- for formatters and linters
    use { "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }
    use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }

    ---------------------------
    -- Programming Languages --
    ---------------------------

    use { "simrat39/rust-tools.nvim", commit = "86a2b4e31f504c00715d0dd082a6b8b5d4afbf03" }

    -----------
    -- Games --
    -----------

    -- Tetris
    use { "alec-gibson/nvim-tetris" }

    -- Minesweeper
    use { "seandewar/nvimesweeper" }

    -- Killersheep
    use { "seandewar/killersheep.nvim" }

    -- Due.nvim
    use { "NFrid/due.nvim" }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- nvim-notify
    use { "rcarriga/nvim-notify" }

    -- hlslens
    use { "kevinhwang91/nvim-hlslens", commit = "b00336ebecc7115740577afa267ff8c26c6b31dc" }

    -- highlight-current-n.nvim
    use { "rktjmp/highlight-current-n.nvim" }

    -- range-highlight.nvim"
    use { "winston0410/range-highlight.nvim" }

    -- <leader>s open spotify tui (spotify-tui)
    -- <leader>k open kubernetes tui (k9s)

    -- zen mode
    -- TODO

    -- mkdir.nvim
    use {
        "jghauser/mkdir.nvim",
    }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", commit = "518e27589c0463af15463c9d675c65e464efc2fe" }
    use { "nvim-treesitter/nvim-treesitter-context", commit = "3148205c72a535af0493fec7c90a12344ac2f90d" }

    -- Git
    use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }
    use { "f-person/git-blame.nvim" } -- git blame

    -- DAP
    use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
    use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
    use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

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
