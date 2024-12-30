local syntax = vim.api.nvim_create_augroup('duck_syntax', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  group = syntax,
  pattern = '*.duck',
  callback = function()
    vim.cmd [[
            syntax keyword duckKeyword and break const case comptime const continue default defer else enum errdefer error extern fallthrough fn for go goto if in inout inline linksection loop nil or orelse owned packed pub resume return select struct suspend switch test threadlocal try type union unreachable var volatile while
            syntax keyword duckType anytype u8 u16 u32 u64 u128 usize i8 i16 i32 i64 i128 isize f16 f32 f64 f80 c8 c16 c32 c64 c128 bool string
            " syntax keyword duckType anytype f16 f32 f64 bool string

            syntax keyword duckPreProc import pkg

            syntax keyword duckConstant nil
            syntax keyword duckBoolean true false
            syntax keyword duckOperator + - * / % = == != < > <= >=

            " Strings
            syntax region duckString start=+"+ end=+"+
            syntax region duckString start=+'"'+ end=+'"'+

            " Comments
            syntax match duckComment "//.*"
            syntax region duckComment start="/\*" end="\*/" contains=cminusComment

            " Numerics
            " syntax match duckNumber "\d\(\.\d\+\)\?"
            " syn match   duckNumber /-\?\<\d\+\>/

            syntax match duckDecNumber display "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
            syntax match duckBinNumber display "\v<0b[01]%(_?[01])*"

            " Function
            " syntax match duckFunction "\w\+\s*"
            " syn keyword duckKeyword fn nextgroup=duckFuncName skipwhite skipempty
            syntax match duckFunction "\<\h\w*\ze\_s*("

            " Builtin functions
            syntax keyword duckBuiltin len cap append copy delete panic recover
            syntax match duckBuiltin /@\%(println\|compileError\|embedFile\|otherBuiltin\)/


            highlight default link duckDecNumber duckNumber
            highlight default link duckBinNumber duckNumber

            " syn keyword duckVarDecl var skipwhite nextgroup=duckVarName
            " syn keyword duckConstDecl const skipwhite nextgroup=duckVarName
            syn match duckVarName /\<[A-Za-z_][A-Za-z_0-9]*\>/ skipwhite contained

            " Highlighting groups
            highlight link duckVarDecl Define
            highlight link duckVarName Identifier 
            highlight link duckKeyword Keyword
            highlight link duckPreProc Statement 
            highlight link duckType Type
            highlight link duckBoolean Boolean
            highlight link duckConstant Constant
            highlight link duckOperator Operator
            highlight link duckString String
            highlight link duckNumber Number
            highlight link duckFunction Function
            highlight link duckComment Comment
            highlight link duckBuiltin Special 
        ]]
  end,
})

return {}
