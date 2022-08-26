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
        -- (js/ts, react, svelte, astro, tailwind, prisma, deno)        --
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
        ------------------------------------------------------------------
        -- Systems-level dev                                            --
        --                                                              --
        -- go -> gofmt                                                  --
        -- rust -> rustfmt                                              --
        ------------------------------------------------------------------
        -- General purpose programming / dev                            --
        --                                                              --
        -- python -> black                                              --
        -- lua -> stylua                                                --
        -- markdown -> markdownlint                                     --
        ------------------------------------------------------------------
        -- Other TODO                                                   --
        --                                                              --
        -- nginx -> nginx_beautifier                                    --
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

        formatting.rustfmt, -- rust
        formatting.gofmt, -- go

        formatting.black.with { extra_args = { "--fast" } }, -- python
        formatting.stylua, -- lua
        formatting.markdownlint, -- markdown

        formatting.nginx_beautifier, -- nginx
        formatting.protolint, -- protobuf
        formatting.google_java_format, -- java

        -------------------------------------------------------------
        -- Diangostics for various languages/libs/tools/frameworks --
        --                                                         --
        -- js/ts -> prettier, eslint                               --
        -- python -> flake8                                        --
        -- lua -> stylua                                           --
        -- markdown -> markdownlint                                --
        -- nginx -> nginx_beautifier                               --
        -- prisma -> prismaFMT                                     --
        -- protobuf -> protobuf                                    --
        -- rust -> rustfmt                                         --
        -- java -> google_java_format                              --
        -------------------------------------------------------------

        diagnostics.flake8, -- python
        diagnostics.eslint,
        diagnostics.semgrep,
        diagnostics.tsc,
    },
}
