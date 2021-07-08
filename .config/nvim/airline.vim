" Airline settings

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#format = 2
let g:airline_detect_spelllang = 0
let g:airline#extensions#localsearch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline_highlighting_cache = 1
let g:airline_section_c = '%{pathshorten(fnamemodify(expand(bufname()), ":~:."))}'
let g:airline_section_z = '%P [%l:%c]'

" Remove section y
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c'],
    \ [ 'x', 'z' ]
    \ ]

" Toggle between long and short filenames in section c
let g:airline_short_path = 1
function! ToggleShort()
    if g:airline_short_path
        let g:airline_section_c = '%{fnamemodify(expand(bufname()), ":~:.")}'
        let g:airline_short_path = 0
        AirlineRefresh 
    else
        let g:airline_section_c = '%{pathshorten(fnamemodify(expand(bufname()), ":~:."))}'
        let g:airline_short_path = 1
        AirlineRefresh
    endif
endfunction

nnoremap <silent> <leader>Af :call ToggleShort()<CR>
