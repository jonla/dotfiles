" Nvim-tree settings

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1 

" nnoremap <leader>t :NvimTreeToggle<CR>
" nnoremap <leader>Tf :NvimTreeFindFile<CR>

" Check if nvim-tree is open or active
function! IsNvimTreeOpen()
  return bufwinnr("NvimTree") != -1
endfunction

function! CheckIfCurrentBufferIsFile()
  return filereadable(expand('%'))
endfunction

" Call NvimTreeFindFile if NvimTree is active, current window contains an actual
" file and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNvimTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NvimTreeFindFile
    wincmd p
  endif
endfunction

" Sync NvimTree when entering buffer
autocmd BufEnter * call SyncTree()

" Custom NvimTree toggle function
function! ToggleTree()
  if IsNvimTreeOpen()
    NvimTreeClose
  else
    if CheckIfCurrentBufferIsFile()
      NvimTreeFindFile
      wincmd p
    else
      " NvimTree not open, and buffer not a file -> Simply open NvimTree
      NvimTreeOpen
      wincmd p
    endif
  endif
endfunction

" Custom NvimTree open function
function! OpenTree()
  if CheckIfCurrentBufferIsFile()
    NvimTreeFindFile
  else
    " Buffer not a file -> Simply open NvimTree
    NvimTreeOpen
  endif
endfunction

nnoremap <leader>t :call ToggleTree()<CR>
nnoremap <leader>T :call OpenTree()<CR>

lua << EOF
require'nvim-tree'.setup{
    auto_close = true,
}
EOF
