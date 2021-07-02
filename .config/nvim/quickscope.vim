" Quick-Scope settings

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_second_highlight=0
" Should probably be in autocmd? Check github
highlight QuickScopePrimary cterm=underline
highlight QuickScopeSecondary cterm=underline,italic
