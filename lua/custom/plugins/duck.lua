-- local syntax = vim.api.nvim_create_augroup('duck_syntax', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  group = syntax,
  pattern = '*.duck',
  callback = function()
    vim.cmd [[
            syntax keyword duckKeyword and break const case comptime const continue default defer else enum errdefer error extern fallthrough fn for go goto if import in inout inline linksection loop nil or orelse owned pkg packed pub resume return select struct suspend switch test threadlocal try type union unreachable var volatile while
            syntax keyword duckType u8 u16 u32 u64 i8 i16 i32 i64 f32 f64 bool string
            syntax keyword duckConstant true false nil
            syntax keyword duckOperator + - * / % = == != < > <= >=

            " Strings
            syntax region duckString start=+"+ end=+"+
            syntax region duckString start=+'"'+ end=+'"'+

            " Comments
            syntax match duckComment "//.*"
            syntax region duckComment start="/\*" end="\*/" contains=cminusComment

            " Numerics
            syntax match duckNumber "\d\(\.\d\+\)\?"

            " Function
            syntax match duckFunction "\w\+\s*"

            " Highlighting groups
            highlight link duckKeyword Keyword
            highlight link duckType Type
            highlight link duckConstant Constant
            highlight link duckOperator Operator
            highlight link duckString String
            highlight link duckNumber Number
            highlight link duckFunction Function
            highlight link duckComment Comment
        ]]
  end,
})

return {}
