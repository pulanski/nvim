local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
    return
end

local status_ok_mason_lspconfig, mason_lspconfig =
    pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
    return
end

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)

-- Available servers can be found here
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local servers = {
    "awk_ls", -- awk
    "angularls", -- angular
    "ansiblels", -- ansible
    -- "asm_lsp", -- assembly
    "astro", -- astro
    "bashls", -- bash
    "clangd", -- c, c++
    "cmake", -- cmake
    "cssls", -- css
    "cssmodules_ls",
    "denols", -- deno
    "dockerls", -- docker
    "eslint", -- eslint
    "golangci_lint_ls", -- go
    "gradle_ls", -- gradle
    "grammarly", -- grammarly
    "graphql", -- graphql
    "html", -- html
    "jdtls", -- java
    "jsonls", -- json
    "julials", -- julia
    "kotlin_language_server", -- kotlin
    "ltex", -- latex
    "sumneko_lua", -- lua
    "marksman", -- markdown
    "prismals", -- prisma
    "pyright", -- python
    "rust_analyzer", -- rust
    "sqlls", -- sql
    "stylelint_lsp", -- stylelint
    "svelte", -- svelte
    "taplo", -- toml
    "tailwindcss", -- tailwind
    "terraformls", -- terraform
    "tflint",
    "tsserver", -- typescript
    "yamlls", -- yaml
    "zls", -- zig
}

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    server = vim.split(server, "@")[1]
    if server == "sumneko_lua" then
        local sumneko_lua_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
    end

    if server == "clangd" then
        local clangd_opts = require("user.lsp.settings.clangd")
        opts = vim.tbl_deep_extend("force", clangd_opts, opts)
    end

    lspconfig[server].setup(opts)
end
