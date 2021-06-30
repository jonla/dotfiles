" General settings

" Space is the leader key!
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:mapleader = " "

" Map ; to : to get to save one keystroke
noremap ; :

nmap <leader>w :w!<cr>
nmap <leader>Q :q<cr>

" Shift insensitive save and exit
command! W w
command! Q q
command! Wq wq
command! WQ wq

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Easier moving code blocks
vnoremap < <gv
vnoremap > >gv

" Move lines in visual mode
vnoremap <up>   :m '<-2<CR>gv=gv
vnoremap <down> :m '>+1<CR>gv=gv

" Disable highlight
map <silent> <leader><cr> :noh<cr>

" Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffers
map <leader>o :only<cr>
map <leader>q :bd<cr>
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
map <leader>l :e#<cr>

" Opens a file in the current buffer's path
map <leader>e :e <c-r>=Relpath(expand("%:h"))<cr>

" Copy filename
nmap <leader>cs :let @+=expand("%:t")<CR>
nmap <leader>cr :let @+=fnamemodify(expand("%"), ":~:.")<CR>
nmap <leader>cl :let @+=expand("%:p")<CR>

map 0 ^  " Remap 0 to first non-blank character

" Spelling
map <leader>ss :setlocal spell!<cr>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=

" Files
map <leader>m :e ~/notes.md<cr>
map <leader>R :e $MYVIMRC <CR>

" Helper functions
" Returns relative file path to buffer
function! Relpath(filename)
    let cwd = getcwd()
    let s = substitute(a:filename, l:cwd . "/" , "", "")
    if s == ''
        return s
    else
        let s .= "/"
        return s
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
