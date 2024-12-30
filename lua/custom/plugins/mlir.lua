local syntax = vim.api.nvim_create_augroup('mlir_syntax', { clear = true })

-- derived/extended from https://github.com/llvm/llvm-project/blob/main/mlir/utils/vim/syntax/mlir.vim
vim.api.nvim_create_autocmd('BufEnter', {
  group = syntax,
  pattern = '*.mlir',
  callback = function()
    vim.cmd [[
            syn case match
            
            " Types.
            "
            syn keyword mlirType index f16 f32 f64 bf16
            " Signless integer types.
            syn match mlirType /\<i\d\+\>/
            " Unsigned integer types.
            syn match mlirType /\<ui\d\+\>/
            " Signed integer types.
            syn match mlirType /\<si\d\+\>/

            " Elemental types inside memref, tensor, or vector types.
            syn match mlirType /x\s*\zs\(bf16|f16\|f32\|f64\|i\d\+\|ui\d\+\|si\d\+\)/

            " Shaped types.
            syn match mlirType /\<memref\ze\s*<.*>/
            syn match mlirType /\<tensor\ze\s*<.*>/
            syn match mlirType /\<vector\ze\s*<.*>/

            " vector types inside memref or tensor.
            syn match mlirType /x\s*\zsvector/

            " Operations.
            " TODO: this list is not exhaustive.
            syn keyword mlirOps alloc alloca addf addi and call call_indirect cmpf cmpi
            syn keyword mlirOps constant dealloc divf dma_start dma_wait dim exp
            syn keyword mlirOps getTensor index_cast load log memref_cast
            syn keyword mlirOps memref_shape_cast mulf muli negf powf prefetch rsqrt sitofp
            syn keyword mlirOps splat store select sqrt subf subi subview tanh
            syn keyword mlirOps view

            syn match mlirOps /\<affine\.apply\>/
            syn match mlirOps /\<affine\.dma_start\>/
            syn match mlirOps /\<affine\.dma_wait\>/
            syn match mlirOps /\<affine\.for\>/
            syn match mlirOps /\<affine\.if\>/
            syn match mlirOps /\<affine\.load\>/
            syn match mlirOps /\<affine\.parallel\>/
            syn match mlirOps /\<affine\.prefetch\>/
            syn match mlirOps /\<affine\.store\>/
            syn match mlirOps /\<scf\.execute_region\>/
            syn match mlirOps /\<scf\.for\>/
            syn match mlirOps /\<scf\.if\>/
            syn match mlirOps /\<scf\.yield\>/
            " syn match mlirOps /\<arith\.constant\>/

            " Keywords.
            syn keyword mlirKeyword
                  \ affine_map
                  \ affine_set
                  \ dense
                  \ else
                  \ func
                  \ module
                  \ return
                  \ step
                  \ to

            syn match   mlirNumber /-\?\<\d\+\>/
            " Match numbers even in shaped types.
            syn match   mlirNumber /-\?\<\d\+\ze\s*x/
            syn match   mlirNumber /x\s*\zs-\?\d\+\ze\s*x/

            syn match   mlirFloat  /-\?\<\d\+\.\d*\(e[+-]\d\+\)\?\>/
            syn match   mlirFloat  /\<0x\x\+\>/
            syn keyword mlirBoolean true false

            " Spell checking is enabled only in comments by default.
            syn match   mlirComment /\/\/.*$/ contains=@Spell
            syn region  mlirString start=/"/ skip=/\\"/ end=/"/
            syn match   mlirLabel /[-a-zA-Z$._][-a-zA-Z$._0-9]*:/

            " Prefixed identifiers usually used for ssa values and symbols.
            syn match   mlirIdentifier /[%@][a-zA-Z$._-][a-zA-Z0-9$._-]*/
            syn match   mlirIdentifier /[%@]\d\+\>/

            " Highlighting groups
            highlight link mlirType Type
            highlight link mlirOps Statement
            highlight link mlirKeyword Keyword
            highlight link mlirBoolean Boolean
            " highlight link mlirConstant Constant
            " highlight link mlirOperator Operator
            " highlight link mlirString String
            highlight link mlirNumber Number
            " highlight link mlirFunction Function
            " highlight link mlirComment Comment
            highlight link mlirIdentifier Identifier

            " HiLink mlirType Type
            " HiLink mlirOps Statement
            " HiLink mlirNumber Number
            " HiLink mlirComment Comment
            " HiLink mlirString String
            " HiLink mlirLabel Label
            " HiLink mlirKeyword Keyword
            " HiLink mlirBoolean Boolean
            " HiLink mlirFloat Float
            " HiLink mlirConstant Constant
            " HiLink mlirSpecialComment SpecialComment
            " HiLink mlirIdentifier Identifier
            " HiLink mlirBlockIdentifier Label
            " HiLink mlirTypeIdentifier Type
            " HiLink mlirAttrIdentifier PreProc
        ]]
  end,
})

return {}
