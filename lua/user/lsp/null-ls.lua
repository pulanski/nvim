local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

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

        formatting.buf, -- formatting for .proto files

        -- Scripting / General purpose
        --
        -- python -> black
        -- elixir -> mix
        -- lua -> stylua

        formatting.black.with { extra_args = { "--fast" } },
        formatting.isort, -- Python utility / library to sort imports
        -- alphabetically and automatically separate them into sections and by type.
        formatting.mix,
        formatting.stylua,

        -- Other TODO
        --
        -- nginx -> nginx_beautifier
        -- markdown -> markdownlint
        -- protobuf -> protobuf
        -- java -> google_java_format

        formatting.markdownlint,
        formatting.nginx_beautifier,
        formatting.protolint,
        formatting.google_java_format,
        formatting.fish_indent, -- indentation and prettifying for fish scripts

        formatting.latexindent, -- A perl script for formatting LaTeX files
        -- that is generally included in major TeX distributions.
        formatting.ocdc, -- formatting for changelog files

        formatting.pg_format, -- formatting for SQL syntax beautifier
        formatting.trim_whitespace, -- simple wrapper around awk for removing
        -- trailing whitespace

        ------------------
        -- Code Actions --
        ------------------

        code_actions.cspell,
        code_actions.eslint_d, -- Injects actions to fix ESLint issues or
        -- ignore broken rules. Like ESLint, but faster.
        code_actions.refactoring, -- The Refactoring library based off the
        -- Refactoring book by Martin Fowler.
        code_actions.shellcheck, -- Provides actions to disable ShellCheck
        -- errors/warnings, either for the current line or for the entire file.

        -----------
        -- Hover --
        -----------

        hover.dictionary, -- Shows the first available definition for the
        -- current word under the cursor.
        hover.printenv, -- Shows the value for the current environment
        -- variable under the cursor.

        -------------------------------------------------------------
        -- Diagnostics for various languages/libs/tools/frameworks --
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
        diagnostics.mypy, -- optional static type checker for Python that aims
        -- to combine the benefits of dynamic (or "duck") typing and static typing.
        diagnostics.semgrep, -- c#, go, java, js, jsx, json, php, python, ruby, scala, ts, tsx
        diagnostics.luacheck, -- lua
        diagnostics.scalafmt, -- scala

        -- Systems-level
        -- revive -> go
        diagnostics.revive, -- go
        diagnostics.cppcheck, -- c/c++
        diagnostics.checkmake, -- make linter.

        diagnostics.shellcheck, -- sh
        -- TODO (currently broken) diagnostics.selene, -- lua
        diagnostics.zsh, -- zsh
        diagnostics.fish, -- fish
        diagnostics.buf, -- protobuf
        -- TODO (currently broken)
        diagnostics.cspell, -- spell check
        diagnostics.ansiblelint, -- ansible
        diagnostics.actionlint, -- github actions
        diagnostics.buildifier, -- buildifier (Bazel)
        diagnostics.credo, -- elixir

        -- Mathematics
        diagnostics.chktex, -- LaTeX
        diagnostics.mlint, -- linting for MATLAB files

        -- TODO (currently broken)
        diagnostics.editorconfig_checker, -- verify that your files are in
        -- harmony with your .editorconfig.
    },
}
