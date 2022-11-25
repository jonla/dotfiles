" General settings

" Space is the leader key!
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:mapleader = " "

" Switch ; and : for easier command mode
vnoremap ; :
vnoremap : ;
nnoremap ; :
nnoremap : ;

" inoremap <leader><leader> <Esc>
" Fast switching to the alternate file
" nnoremap <BS> :buffer#<CR>
" Window management
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 6/5)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 5/6)<CR>

" Command-line hjkl-style search
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Some day I might:
"noremap h <nop>
"noremap j <nop>
"noremap k <nop>
"noremap l <nop>
"inoremap <esc> <nop>

nnoremap <leader>w :w!<cr>
nnoremap <leader>Q :q<cr>

" Disable Ex mode
nnoremap Q <nop>

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
nnoremap <silent> <leader><cr> :noh<cr>

" h-j-k-l mode-agnostic means of switching windows
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
inoremap <C-h> <Esc><c-w>h
inoremap <C-j> <Esc><c-w>j
inoremap <C-k> <Esc><c-w>k
inoremap <C-l> <Esc><c-w>l
vnoremap <C-h> <Esc><c-w>h
vnoremap <C-j> <Esc><c-w>j
vnoremap <C-k> <Esc><c-w>k
vnoremap <C-l> <Esc><c-w>l
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

" Terminal
tnoremap jj <C-\><C-n>
" nr2char({expr}) returns string with value {expr}
" Equivalent to <C-\><C-n>"[reg]pi: paste the contents of [reg]
tnoremap <expr> <C-v> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Buffers
nnoremap <leader>o :only<cr>
nnoremap <leader>q :bd<cr>
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
nnoremap <leader>l :e#<cr>

" Opens a file in the current buffer's path
nnoremap <leader>E :e <c-r>=Relpath(expand("%:h"))<cr>

" Copy filename
nnoremap <leader>cs :let @+=expand("%:t")<CR>
nnoremap <leader>cr :let @+=fnamemodify(expand("%"), ":~:.")<CR>
nnoremap <leader>cl :let @+=expand("%:p")<CR>

" Remap 0 to first non-blank character
nnoremap 0 ^

" Spelling
nnoremap <leader>ss :setlocal spell!<cr>
" nnoremap <leader>sn ]s
" nnoremap <leader>sp [s
" nnoremap <leader>sa zg
" nnoremap <leader>s? z=

" Files
nnoremap <leader>m :e ~/notes.md<cr>
nnoremap <leader>R :e $MYVIMRC <CR>

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
