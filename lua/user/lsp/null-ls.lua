local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        ------------------------------------------------------------------
        -- Formatting tools for various languages/libs/tools/frameworks --
        ------------------------------------------------------------------

        -- Web dev
        -- (js/ts, react, tailwind, prisma, deno)
        formatting.eslint,
        formatting.prettier.with {
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
        formatting.stylelint,
        formatting.rustywind,
        -- formatting.prismaFMT,
        formatting.deno_fmt,

        -- Mobile / Cross-platform
        -- (flutter, kotlin, swift)
        --
        -- dart/flutter -> dart_format
        -- swift -> swiftformat
        -- kotlin -> ktlint

        -- dart/flutter
        formatting.dart_format,
        -- swift
        formatting.swiftformat,
        -- kotlin
        formatting.ktlint,

        -- Systems-level
        --
        -- go -> gofumpt
        -- rust -> rustfmt

        formatting.rustfmt,
        formatting.gofumpt,

        -- Scripting / General purpose
        --
        -- python -> black
        -- elixir -> mix
        -- lua -> stylua

        formatting.black.with { extra_args = { "--fast" } },
        formatting.mix,
        formatting.stylua,

        -- Other TODO
        --
        -- nginx -> nginx_beautifier
        -- markdown -> markdownlint
        -- protobuf -> protobuf
        -- java -> google_java_format

        formatting.markdownlint,
        -- formatting.nginx_beautifier,
        formatting.protolint,
        formatting.google_java_format,

        -------------------------------------------------------------
        -- Diangostics for various languages/libs/tools/frameworks --
        -------------------------------------------------------------

        -- python -> flake8                                        --
        -- (c#, go, java, js, jsx, json, php, python,              --
        -- ruby, scala, ts, tsx) -> semgrep                        --
        -- go -> revive                                            --
        -- sh -> shellcheck                                        --
        -- zsh -> zsh                                              --
        -- fish -> fish                                            --
        -- editorconfig_checker -> editorconfig                    --
        -------------------------------------------------------------

        -- Web dev
        --
        -- js/ts -> eslint, tsc
        -- css, scss, sass, less -> stylelint
        diagnostics.eslint,
        diagnostics.tsc,
        diagnostics.stylelint,

        -- Scripting / General purpose
        --
        --
        diagnostics.flake8, -- python
        diagnostics.semgrep, -- c#, go, java, js, jsx, json, php, python, ruby, scala, ts, tsx

        -- Systems-level
        -- revive -> go
        diagnostics.revive, -- go
        diagnostics.cppcheck, -- c/c++
        diagnostics.shellcheck, -- sh
        -- TODO (currently broken) diagnostics.selene, -- lua
        diagnostics.zsh, -- zsh
        diagnostics.fish, -- fish
        -- TODO (currently broken) diagnostics.buff, -- protobuf
        -- TODO (currently broken) diagnostics.cspell, -- spell check
        diagnostics.ansiblelint, -- ansible
        diagnostics.actionlint, -- github actions
        diagnostics.buildifier, -- buildifier (Bazel)
        diagnostics.credo, -- elixir
        -- TODO (currently broken) diagnostics.editorconfig_checker, -- editorconfig
    },
}
