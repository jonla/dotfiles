" NERDTree settings

" Have NERDTree open on the right side
let g:NERDTreeWinPos = "right"

" Toggle NERDTree
map <silent> <leader>t :NERDTreeToggle<CR>

" Localize current buffer in NERDTree
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

" Close vim if NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable NERDTree help message
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
