local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- All plugins are installed here
return packer.startup(function(use)
    ---------------------
    -- Plugin Mangager --
    ---------------------

    -- Have packer manage itself
    use("wbthomason/packer.nvim")

    ---------------------
    -- Lua Development --
    ---------------------

    -- useful lua functions used by lots of plugins
    use("nvim-lua/plenary.nvim")
    -- popup API for neovim (WIP)
    use("nvim-lua/popup.nvim")

    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("kyazdani42/nvim-tree.lua")
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")
    use("nvim-lualine/lualine.nvim")
    use("ahmedkhalf/project.nvim")
    use("lewis6991/impatient.nvim")
    use("lukas-reineke/indent-blankline.nvim")

    -----------
    -- Icons --
    -----------

    -- collection of popular webdev icons
    use("kyazdani42/nvim-web-devicons")
    -- collection of configurations for nvim-web-devicons
    -- use({
    --     "yamatsum/nvim-nonicons",
    --     requires = { "kyazdani42/nvim-web-devicons" },
    -- })
    -- emoji/icon picker
    use("ziontee113/icon-picker.nvim")

    ------------------
    -- IDE Features --
    ------------------

    -- nvim opening dashboard
    use("goolord/alpha-nvim")
    -- terminal usage in neovim
    use("akinsho/toggleterm.nvim")
    -- notifications manager
    use("rcarriga/nvim-notify")
    -- telescope (file search, grep search, etc.)
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("gorbit99/codewindow.nvim")

    ------------------------
    -- Editor Enhancement --
    ------------------------

    -- autopairs, integrates with both cmp and treesitter
    use("windwp/nvim-autopairs")
    -- highlights trailing whitespace
    use("ntpeters/vim-better-whitespace")
    -- peeks lines of the buffer in non-obtrusive way.
    -- (e.g. :35 will preview or peek line 35 without jumping and can be cancelled)
    use("nacro90/numb.nvim")
    -- zen mode
    use("folke/zen-mode.nvim")
    -- cycle buffers with a simple UI
    use("ghillb/cybu.nvim")
    -- lightbulb for nvim's builtin lsp (similar ux for vscode)
    use("antoinemadec/FixCursorHold.nvim")
    use({
        "kosayoda/nvim-lightbulb",
        requires = "antoinemadec/FixCursorHold.nvim",
    })
    -- display due dates for dates in simple format
    -- for dates seen within the current buffer
    use("NFrid/due.nvim")
    -- scrollbar for better understanding current location in file
    -- use("Xuyuanp/scrollbar.nvim")
    use("petertriho/nvim-scrollbar")
    -- smooth scrolling within neovim
    use("karb94/neoscroll.nvim")
    -- enhanced highlighting during search
    -- (e.g. search for `/foo` and the `n` and `N` keys
    use("rktjmp/highlight-current-n.nvim")
    -- highlighting utility
    use("winston0410/range-highlight.nvim")
    -- highlights parts of line over current textwidth
    use("lcheylus/overlength.nvim")
    -- comments
    use("numToStr/Comment.nvim")
    -- comments for todos, fixmes, etc. written in source code
    use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
    -- editorconfig usage within neovim
    use("gpanders/editorconfig.nvim")
    -- enhanced highlighting for searches within the editor
    use("kevinhwang91/nvim-hlslens")
    -- virtual text of current context after functions, methods, tables, etc.
    -- use("haringsrob/nvim_context_vt")

    -- TODO update config
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    ---------
    -- LSP --
    ---------

    -- enable LSP
    use("neovim/nvim-lspconfig")
    -- package manager for neovim (LSP servers, DAP servers, linters, and formatters)
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    -- for formatters and linters
    use("jose-elias-alvarez/null-ls.nvim")

    use("ray-x/lsp_signature.nvim")
    use("RRethy/vim-illuminate")
    -- show lsp diagnostics in lines between source text
    use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
    -- tree-like view for symbols in neovim using the lsp
    use("simrat39/symbols-outline.nvim")
    -- alternative lsp implementation
    -- use "glepnir/lspsaga.nvim"

    -----------------
    -- Completions --
    -----------------

    -- cmp plugin base plugin
    use("hrsh7th/nvim-cmp")
    -- buffer completions
    use("hrsh7th/cmp-buffer")
    -- path completions
    use("hrsh7th/cmp-path")
    -- cmdline completions
    use("hrsh7th/cmp-cmdline")
    -- snippet completions
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-nvim-lua")
    -- use {
    --  "zbirenbaum/copilot-cmp",
    --  module = "copilot-cmp",
    -- }

    --------------
    -- Snippets --
    --------------

    --snippet engine
    use("L3MON4D3/LuaSnip")
    -- collection of useful snippets
    use("rafamadriz/friendly-snippets")

    use("kevinhwang91/promise-async")
    -- code folding (e.g. hiding function details or boilerplate code from
    -- current editor context)
    use("kevinhwang91/nvim-ufo")
    -- allows for the toggling of transparent backgrounds
    use("xiyaowong/nvim-transparent")
    -- vim.ui improvements
    use("stevearc/dressing.nvim")

    -------------------------
    -- Syntax / Treesitter --
    -------------------------

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-context")
    -- autoclose tags for Svelte, JS/JSX/TS/TSX, Vue, etc.
    use("windwp/nvim-ts-autotag")
    -- surround selections with delimiter pairs (e.g. `()` or `{}`)
    use("kylechui/nvim-surround")

    ---------------------------
    -- Keybindings / Keymaps --
    ---------------------------

    -- whichkey
    use("folke/which-key.nvim")

    ---------------
    -- Utilities --
    ---------------

    -- pasting of images into neovim
    use("ekickx/clipboard-image.nvim")
    -- mkdir.nvim
    use("jghauser/mkdir.nvim")
    -- motions plugin
    use("ggandor/leap.nvim")
    -- toggle between absolute and relative number mode
    use("sitiom/nvim-numbertoggle")
    -- intelligently open files to their last edit postion
    use("ethanholz/nvim-lastplace")
    -- vim/nvim usage cheatsheet (useful for new users)
    use({
        "sudormrfbin/cheatsheet.nvim",
        requires = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
    })
    -- buffer switcher ui
    use("matbme/JABS.nvim")
    -- create annotations for code segments
    use({
        "danymat/neogen",
        requires = {
            { "nvim-treesitter/nvim-treesitter" },
        },
    })
    -- internet browsing from within neovim
    use({
        "lalitmee/browse.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
    })

    ------------------
    -- Colorschemes --
    ------------------

    use("folke/tokyonight.nvim")
    use("lunarvim/darkplus.nvim")
    use("savq/melange")
    use("ellisonleao/gruvbox.nvim")
    use("bluz71/vim-moonfly-colors")
    use("catppuccin/nvim")
    use("shaeinst/roshnivim-cs")
    use("rafamadriz/neon")
    use("sainnhe/sonokai")
    use("mhartington/oceanic-next")
    use("glepnir/zephyr-nvim")
    use("tjdevries/colorbuddy.vim")
    use("Th3Whit3Wolf/onebuddy")
    use("ray-x/aurora")
    use("marko-cerovac/material.nvim")
    use("ray-x/starry.nvim")
    use("rktjmp/lush.nvim")
    use("RishabhRD/gruvy")
    use("rockyzhang24/arctic.nvim")
    use("arcticicestudio/nord-vim")

    -- markdown / LaTeX
    use("davidgranstrom/nvim-markdown-preview")
    use("ellisonleao/glow.nvim")

    ---------------------------
    -- Programming Languages --
    ---------------------------

    -- set of useful utilities for enhancing
    -- rust development within neovim
    use("simrat39/rust-tools.nvim")
    -- helps manage cargo dependencies
    use("saecki/crates.nvim")
    -- compiler explorer
    use("krady21/compiler-explorer.nvim")

    ---------
    -- Git --
    ---------

    use("lewis6991/gitsigns.nvim")
    use("f-person/git-blame.nvim")
    use("ruifm/gitlinker.nvim")
    use("mattn/vim-gist")
    use("mattn/webapi-vim")

    ------------
    -- GitHub --
    ------------

    use({
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
    })

    ------------
    -- Docker --
    ------------

    -- docker ui within neovim
    use("skanehira/denops-docker.vim")

    -----------
    -- Bazel --
    -----------

    -- Bazel dependency
    use("google/vim-maktaba")
    -- Execute bazel commands from within neovim
    use("bazelbuild/vim-bazel")

    ----------------
    -- Kubernetes --
    ----------------

    -- k8s dependency
    -- allows you to write neovim plugins in deno
    use("vim-denops/denops.vim")
    use("vim-denops/denops-helloworld.vim")
    -- kubernetes ui within neovim
    use("skanehira/k8s.vim")
    -- kubernetes YAML snippets and integrations with kubectl
    use("andrewstuart/vim-kubernetes")

    -- similar to lazygit usage in whichkey
    -- TODO <leader>s open spotify tui (spotify-tui)
    -- TODO <leader>k open kubernetes tui (k9s)

    -- Testing
    use("klen/nvim-test")

    -- DAP
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("ravenxrz/DAPInstall.nvim")

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

    ------------------------------
    -- Third-party Integrations --
    ------------------------------

    -- Google Keep usage in Neovim
    use({ "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" })

    -----------
    -- Games --
    -----------

    -- tetris
    use("alec-gibson/nvim-tetris")
    -- minesweeper
    use("seandewar/nvimesweeper")
    -- killersheep
    use("seandewar/killersheep.nvim")

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
