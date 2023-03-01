return {
    ---------------------
    -- Lua Development --
    ---------------------

    -- useful lua functions used by lots of plugins
    "nvim-lua/plenary.nvim",
    -- popup API for neovim (WIP)
    "nvim-lua/popup.nvim",

    -- "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-tree.lua",
    "akinsho/bufferline.nvim",
    "moll/vim-bbye",
    "nvim-lualine/lualine.nvim",
    "ahmedkhalf/project.nvim",
    "lewis6991/impatient.nvim",
    "lukas-reineke/indent-blankline.nvim",
    --
    -----------
    -- Icons --
    -----------

    -- collection of popular webdev icons
    "kyazdani42/nvim-web-devicons",
    -- collection of configurations for nvim-web-devicons
    -- use({
    --     "yamatsum/nvim-nonicons",
    --     requires = { "kyazdani42/nvim-web-devicons" },
    -- })
    -- emoji/icon picker
    "ziontee113/icon-picker.nvim",

    ------------------
    -- IDE Features --
    ------------------

    -- nvim opening dashboard
    "goolord/alpha-nvim",
    -- terminal usage in neovim
    "akinsho/toggleterm.nvim",
    -- -- notifications manager
    "rcarriga/nvim-notify",
    -- telescope (file search, grep search, etc.)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "gorbit99/codewindow.nvim",

    ------------------------
    -- Editor Enhancement --
    ------------------------

    -- autopairs, integrates with both cmp and treesitter
    "windwp/nvim-autopairs",
    -- highlights trailing whitespace
    "ntpeters/vim-better-whitespace",
    -- peeks lines of the buffer in non-obtrusive way.
    -- (e.g. :35 will preview or peek line 35 without jumping and can be cancelled)
    "nacro90/numb.nvim",
    -- zen mode
    "folke/zen-mode.nvim",
    -- cycle buffers with a simple UI
    "ghillb/cybu.nvim",
    -- lightbulb for nvim's builtin lsp (similar ux for vscode)
    "antoinemadec/FixCursorHold.nvim",
    {
        "kosayoda/nvim-lightbulb",
        dependencies = { "antoinemadec/FixCursorHold.nvim" },
    },
    -- display due dates for dates in simple format
    -- for dates seen within the current buffer
    "NFrid/due.nvim",
    -- scrollbar for better understanding current location in file
    -- use("Xuyuanp/scrollbar.nvim")
    "petertriho/nvim-scrollbar",
    -- smooth scrolling within neovim
    "karb94/neoscroll.nvim",
    -- enhanced highlighting during search
    -- (e.g. search for `/foo` and the `n` and `N` keys
    "rktjmp/highlight-current-n.nvim",
    -- highlighting utility
    "winston0410/range-highlight.nvim",
    -- highlights parts of line over current textwidth
    "lcheylus/overlength.nvim",
    -- comments
    "numToStr/Comment.nvim",
    -- comments for todos, fixmes, etc. written in source code
    { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
    -- editorconfig usage within neovim
    "gpanders/editorconfig.nvim",
    -- enhanced highlighting for searches within the editor
    "kevinhwang91/nvim-hlslens",
    -- virtual text of current context after functions, methods, tables, etc.
    "haringsrob/nvim_context_vt",

    -- -- TODO update config
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
        -- }
    },

    -- ---------
    -- -- LSP --
    -- ---------

    -- -- enable LSP
    -- -- use("neovim/nvim-lspconfig")
    "neovim/nvim-lspconfig",
    -- -- package manager for neovim (LSP servers, DAP servers, linters, and formatters)
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- -- for formatters and linters
    "jose-elias-alvarez/null-ls.nvim",

    "ray-x/lsp_signature.nvim",
    "RRethy/vim-illuminate",
    -- show lsp diagnostics in lines between source text
    -- use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    -- tree-like view for symbols in neovim using the lsp
    "simrat39/symbols-outline.nvim",
    -- -- alternative lsp implementation
    -- -- use "glepnir/lspsaga.nvim" <- NOT USED

    -----------------
    -- Completions --
    -----------------

    -- cmp plugin base plugin
    "hrsh7th/nvim-cmp",
    -- buffer completions
    "hrsh7th/cmp-buffer",
    -- path completions
    "hrsh7th/cmp-path",
    -- cmdline completions
    "hrsh7th/cmp-cmdline",
    -- snippet completions
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    -- use("hrsh7th/cmp-nvim-lsp")
    "hrsh7th/cmp-emoji",
    -- use("hrsh7th/cmp-emoji")
    "hrsh7th/cmp-nvim-lua",
    -- -- use("hrsh7th/cmp-nvim-lua")
    -- -- use {
    -- --  "zbirenbaum/copilot-cmp",
    -- --  module = "copilot-cmp",
    -- -- }

    --------------
    -- Snippets --
    --------------

    -- snippet engine
    "L3MON4D3/LuaSnip",
    -- collection of useful snippets
    "rafamadriz/friendly-snippets",

    "kevinhwang91/promise-async",
    -- code folding (e.g. hiding function details or boilerplate code from
    -- current editor context)
    "kevinhwang91/nvim-ufo",
    -- allows for the toggling of transparent backgrounds
    "xiyaowong/nvim-transparent",
    -- vim.ui improvements
    "stevearc/dressing.nvim",

    -------------------------
    -- Syntax / Treesitter --
    -------------------------

    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",
    -- -- autoclose tags for Svelte, JS/JSX/TS/TSX, Vue, etc.
    -- "windwp/nvim-ts-autotag",
    -- -- surround selections with delimiter pairs (e.g. `()` or `{}`)
    "kylechui/nvim-surround",

    ---------------------------
    -- Keybindings / Keymaps --
    ---------------------------

    -- whichkey
    "folke/which-key.nvim",

    ---------------
    -- Utilities --
    ---------------

    -- pasting of images into neovim
    "ekickx/clipboard-image.nvim",
    -- mkdir.nvim
    "jghauser/mkdir.nvim",
    -- motions plugin
    "ggandor/leap.nvim",
    -- toggle between absolute and relative number mode
    "sitiom/nvim-numbertoggle",
    -- intelligently open files to their last edit postion
    "ethanholz/nvim-lastplace",
    -- vim/nvim usage cheatsheet (useful for new users)
    {
        "sudormrfbin/cheatsheet.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
    },
    -- buffer switcher ui
    "matbme/JABS.nvim",
    -- create annotations for code segments
    {
        "danymat/neogen",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
        },
    },
    -- -- internet browsing from within neovim
    {
        "lalitmee/browse.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },

    ------------------
    -- Colorschemes --
    ------------------

    "folke/tokyonight.nvim",
    "lunarvim/darkplus.nvim",
    "savq/melange",
    "ellisonleao/gruvbox.nvim",
    "bluz71/vim-moonfly-colors",
    "catppuccin/nvim",
    "shaeinst/roshnivim-cs",
    "rafamadriz/neon",
    "sainnhe/sonokai",
    "mhartington/oceanic-next",
    "glepnir/zephyr-nvim",
    "tjdevries/colorbuddy.vim",
    "Th3Whit3Wolf/onebuddy",
    "ray-x/aurora",
    "marko-cerovac/material.nvim",
    "ray-x/starry.nvim",
    "rktjmp/lush.nvim",
    "RishabhRD/gruvy",
    "rockyzhang24/arctic.nvim",
    "arcticicestudio/nord-vim",
    "bluz71/vim-nightfly-colors",

    -- markdown / LaTeX
    "davidgranstrom/nvim-markdown-preview",
    "ellisonleao/glow.nvim",

    ---------------------------
    -- Programming Languages --
    ---------------------------

    -- set of useful utilities for enhancing
    -- rust development within neovim
    "simrat39/rust-tools.nvim",
    -- helps manage cargo dependencies
    "saecki/crates.nvim",
    -- compiler explorer
    "krady21/compiler-explorer.nvim",

    ---------
    -- Git --
    ---------

    "lewis6991/gitsigns.nvim",
    "f-person/git-blame.nvim",
    "ruifm/gitlinker.nvim",
    "mattn/vim-gist",
    "mattn/webapi-vim",

    ------------
    -- GitHub --
    ------------

    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
    },

    ------------
    -- Docker --
    ------------

    -- docker ui within neovim
    "skanehira/denops-docker.vim",

    -----------
    -- Bazel --
    -----------

    -- Bazel dependency
    "google/vim-maktaba",
    -- Execute bazel commands from within neovim
    -- "bazelbuild/vim-bazel",

    ----------------
    -- Kubernetes --
    ----------------

    -- -- k8s dependency
    -- -- allows you to write neovim plugins in deno
    -- "vim-denops/denops.vim",
    -- "vim-denops/denops-helloworld.vim",
    -- -- kubernetes ui within neovim
    -- "skanehira/k8s.vim",
    -- -- kubernetes YAML snippets and integrations with kubectl
    -- "andrewstuart/vim-kubernetes",

    -- -- similar to lazygit usage in whichkey
    -- -- TODO <leader>s open spotify tui (spotify-tui)
    -- -- TODO <leader>k open kubernetes tui (k9s)

    -- -- Testing
    -- "klen/nvim-test",

    -- -- DAP
    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "ravenxrz/DAPInstall.nvim",

    -- -- Copilot
    "github/copilot.vim",

    -- -- use {
    -- --  "zbirenbaum/copilot.lua",
    -- --  event = { "VimEnter" },
    -- --  config = function ()
    -- --   vim.defer_fn(function ()
    -- --      require("user.copilot")
    -- --    end, 1000)
    -- --  end
    -- -- }

    -- ------------------------------
    -- -- Third-party Integrations --
    -- ------------------------------

    -- -- Google Keep usage in Neovim
    -- -- { "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" },
    { "stevearc/gkeep.nvim",      build = ":UpdateRemotePlugins" },

    -- -----------
    -- -- Games --
    -- -----------

    -- -- tetris
    -- "alec-gibson/nvim-tetris",
    -- -- minesweeper
    -- "seandewar/nvimesweeper",
    -- -- killersheep
    -- "seandewar/killersheep.nvim",

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    -- if PACKER_BOOTSTRAP then
    --     require("packer").sync()
    -- end
    -- end)
}

