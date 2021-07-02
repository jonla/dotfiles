" Airline settings

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#format = 2
let g:airline_detect_spelllang = 0
let g:airline#extensions#localsearch#enabled = 0
let g:airline_section_c = '%{pathshorten(fnamemodify(expand(bufname()), ":~:."))}'
let g:airline_section_z = '%P [%l:%c]'

" Remove section y
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c'],
    \ [ 'x', 'z' ]
    \ ]
