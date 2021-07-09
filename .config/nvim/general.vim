" General settings
" Not set by default in nvim

set nowritebackup
set noswapfile
set clipboard=unnamedplus
set mouse=a
set scrolloff=7
set path+=**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set cursorline
set tabline=0
set hidden
set backspace=eol,start,indent
set whichwrap=""
set ignorecase
set smartcase
set lazyredraw 
set showmatch 
set matchtime=2
set ttimeoutlen=0
set updatetime=300
set shortmess+=c

set number
set signcolumn=number
set expandtab
set shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set linebreak
set textwidth=500
set autoindent
set nowrap

set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set splitbelow
set splitright
set diffopt+=vertical
set switchbuf=useopen,usetab,newtab
set jumpoptions=stack

set inccommand=nosplit

" When switching buffers, preserve window view.
autocmd BufLeave * call AutoSaveWinView()
autocmd BufEnter * call AutoRestoreWinView()

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always in insert mode in terminal
autocmd TermOpen * startinsert

" Auto-reload config file when saving it
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Save current view settings on a per-window, per-buffer basis.
" https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction
