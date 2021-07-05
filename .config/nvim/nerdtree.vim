" NERDTree settings

" Have NERDTree open on the left side
let g:NERDTreeWinPos = "left"

" Disable NERDTree help message
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let NERDTreeShowHidden=1

let NERDTreeStatusline="%{exists('b:NERDTree')?pathshorten(fnamemodify(b:NERDTree.root.path.str(), ':~')):''}"

" Toggle NERDTree
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

" Localize current buffer in NERDTree
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

" Close vim if NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      if bufname('%') =~# 'NERD_tree'
        NERDTreeFind
      else
        set eventignore=BufEnter
        NERDTreeFind
        set eventignore=
      endif
    endif
  else
    set eventignore=BufEnter
    NERDTree
    set eventignore=
  endif
endfunction

" open NERDTree with ctrl + n
nnoremap <leader>t :call ToggleTree()<CR>
""""""""""""""""""

" Remove pwd line on top
" https://github.com/preservim/nerdtree/issues/806
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end
