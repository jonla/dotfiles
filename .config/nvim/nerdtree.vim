" NERDTree settings

" Have NERDTree open on the left side
let g:NERDTreeWinPos = "left"

" Disable NERDTree help message
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let NERDTreeShowHidden=1

let NERDTreeStatusline="%{exists('b:NERDTree')?pathshorten(fnamemodify(b:NERDTree.root.path.str(), ':~')):''}"

" Close vim if NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return filereadable(expand('%'))
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains an actual
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Sync NERDTree when entering buffer
autocmd BufEnter * call SyncTree()

" Custom NERDTree toggle function
function! ToggleTree()
  if IsNERDTreeOpen()
    NERDTreeClose
  else
    if CheckIfCurrentBufferIsFile()
      NERDTreeFind
      wincmd p
    else
      " NERDTree not open, and buffer not a file -> Simply open NERDTree
      NERDTree
      wincmd p
    endif
  endif
endfunction

" Custom NERDTree open function
function! OpenTree()
  if CheckIfCurrentBufferIsFile()
    NERDTreeFind
  else
    " Buffer not a file -> Simply open NERDTree
    NERDTree
  endif
endfunction

nnoremap <leader>t :call ToggleTree()<CR>
nnoremap <leader>T :call OpenTree()<CR>

" Remove pwd line on top
" https://github.com/preservim/nerdtree/issues/806
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end
