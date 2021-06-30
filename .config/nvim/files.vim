" FileType settings

autocmd FileType yaml,jinja,markdown setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal textwidth=100

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.txt,*.cpp,*.h,*.py,*.sh,*.vim :call CleanExtraSpaces()
autocmd BufRead,BufNewFile *.txt,*.md set wrap

" Use sane C-style comments
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
