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
        -- Web dev                                                      --
        -- (js/ts, react, tailwind, prisma, deno)                       --
        --                                                              --
        -- js/ts -> prettier, eslint, stylelint                         --
        -- tailwind classes -> rustywind                                --
        -- prisma -> prismaFMT                                          --
        -- deno -> deno_fmt                                             --
        ------------------------------------------------------------------
        -- Mobile / Cross-platform dev                                  --
        -- (flutter, kotlin, swift)                                     --
        --                                                              --
        -- dart/flutter -> dart_format                                  --
        -- swift -> swiftformat                                         --
        -- kotlin -> ktlint                                             --
        ------------------------------------------------------------------
        -- Systems-level dev                                            --
        --                                                              --
        -- go -> gofumpt                                                --
        -- rust -> rustfmt                                              --
        ------------------------------------------------------------------
        -- Scripting / General purpose dev                              --
        --                                                              --
        -- python -> black                                              --
        -- lua -> stylua                                                --
        ------------------------------------------------------------------
        -- Other TODO                                                   --
        --                                                              --
        -- nginx -> nginx_beautifier                                    --
        -- markdown -> markdownlint                                     --
        -- protobuf -> protobuf                                         --
        -- java -> google_java_format                                   --
        ------------------------------------------------------------------
        formatting.eslint, -- js/ts
        formatting.prettier.with { -- js/ts
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
        formatting.stylelint, -- js/ts
        formatting.rustywind, -- tailwind classes
        formatting.prismaFMT, -- prisma (schema)
        formatting.deno_fmt, -- deno

        formatting.dart_format, -- dart/flutter
        formatting.swiftformat, -- swift
        formatting.ktlint, -- kotlin

        formatting.rustfmt, -- rust
        formatting.gofumpt, -- go

        formatting.black.with { extra_args = { "--fast" } }, -- python
        formatting.stylua, -- lua
        formatting.markdownlint, -- markdown

        formatting.nginx_beautifier, -- nginx
        formatting.protolint, -- protobuf
        formatting.google_java_format, -- java

        -------------------------------------------------------------
        -- Diangostics for various languages/libs/tools/frameworks --
        --                                                         --
        -- js/ts -> eslint, tsc                                    --
        -- css, scss, sass, less -> stylelint                      --
        -- python -> flake8                                        --
        -- (c#, go, java, js, jsx, json, php, python,              --
        -- ruby, scala, ts, tsx) -> semgrep                        --
        -- go -> revive                                            --
        -- sh -> shellcheck                                        --
        -- zsh -> zsh                                              --
        -- fish -> fish                                            --
        -- editorconfig_checker -> editorconfig                    --
        -------------------------------------------------------------
        diagnostics.eslint, -- js/ts
        diagnostics.tsc, -- parses diagnostics from the ts compiler
        diagnostics.stylelint, -- css, scss, sass, less
        diagnostics.flake8, -- python
        diagnostics.semgrep, -- c#, go, java, js, jsx, json, php, python, ruby, scala, ts, tsx
        diagnostics.revive, -- go
        diagnostics.gccdiag, -- c/c++
        diagnostics.cppcheck, -- c/c++
        diagnostics.shellcheck, -- sh
        -- TODO (currently broken) diagnostics.selene, -- lua
        diagnostics.zsh, -- zsh
        diagnostics.fish, -- fish
        diagnostics.buff, -- protobuf
        diagnostics.cspell, -- spell check
        diagnostics.ansiblelint, -- ansible
        diagnostics.actionlint, -- github actions
        diagnostics.buildifier -- buildifier (Bazel)
        -- TODO (currently broken) diagnostics.editorconfig_checker, -- editorconfig
    },
}
