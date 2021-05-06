"        __  __ /\_\    ___ ___   _ __   ___   
"       /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\ 
"     __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/ 
"    /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"    \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors, fonts and appearance 
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Snippets
"    -> Misc
"    -> Plugins
"    -> Helper functions
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:mapleader = " "

" Map ; to : to get to input commands fast
noremap ; :

" Fast saving
nmap <leader>w :w!<cr>

" Fast exit
nmap <leader>Q :q<cr>

" Shift insesitive save and exit
command! W w
command! Q q
command! Wq wq
command! WQ wq

" :W sudo saves the file 
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null

" Enable mouse mode
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Ignore included files in auto-complete
setglobal complete-=i
setlocal complete-=i

" Always show current position
set ruler

" Always show current line
set cursorline

" Height of the command bar
set cmdheight=1

" Hide tabline
set tabline=0

" A buffer becomes hidden when it is abandoned
set hid

" Keep cursor at column when switching buffers
set nostartofline

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=""

" Ignore case when searching
set ignorecase

" Override ignorecase if searching includes upper case character
set smartcase

" Highlight search results
set hlsearch

" Show where pattern matches while searching
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left (not)
" set foldcolumn=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, fonts and appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
" if $COLORTERM == 'gnome-terminal'
"     set t_Co=256
" endif

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Remove vert-split characters
" What abount fold and diff?
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

" Set custom colors 
function! s:patchColors()
    hi vertsplit               ctermfg=Black     ctermbg=DarkGreen
    hi LineNr                  ctermfg=238
    hi StatusLine              ctermfg=Gray  ctermbg=None        cterm=Bold
    hi StatusLineNC            ctermfg=Black     ctermbg=None        cterm=Bold
    hi TabLineFill             ctermfg=Black     ctermbg=None        cterm=None
    hi TabLine                 ctermfg=Blue      ctermbg=Black
    hi CursorLine                                                    cterm=None
    hi CursorLineNr                                                  cterm=None
    hi clear SignColumn        ctermfg=None                          cterm=None
    hi clear FoldColum         ctermfg=None                          cterm=None
    hi GitGutterAdd            ctermfg=Green     ctermbg=None
    hi GitGutterChange         ctermfg=DarkGray  ctermbg=None
    hi GitGutterDelete         ctermfg=Red       ctermbg=None
    hi GitGutterChangeDelete   ctermfg=Red       ctermbg=None  
    hi EndOfBuffer             ctermfg=237
    hi Pmenu                   ctermfg=DarkGreen ctermbg=238
    hi PmenuSel                ctermfg=Red       ctermbg=None
    hi PmenuSbar               ctermfg=Blue      ctermbg=None
    hi PmenuThumb              ctermfg=Yellow    ctermbg=None
    hi ErrorMsg                ctermfg=Black     ctermbg=Red
    hi Error                   ctermfg=Black     ctermbg=Red
    hi ColorColumn             ctermfg=Black     ctermbg=Red
endfunction

" Set color scheme
autocmd! ColorScheme * call s:patchColors()
call s:patchColors()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

autocmd FileType yaml,jinja setlocal ts=2 sts=2 sw=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use numbered lines
set number

" Use spaces instead of tabs
set expandtab
set shiftround

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

" Fix issue with "#" inserted on first line with smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
set nowrap "Don't wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Easier moving code blocks
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" More natural split opening
set splitbelow
set splitright
set diffopt+=vertical

" Close all windows by the current
map <leader>o :on<cr>

" Close the current buffer
map <leader>q :bd<cr>

" Next/previous buffer
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
map <leader>l :e#<cr>

" Opens a file in the current buffer's path
map <leader>e :e <c-r>=Relpath(expand("%:h"))<cr>

" Copy filename
nmap <leader>cs :let @+=expand("%:t")<CR>
nmap <leader>cr :let @+=fnamemodify(expand("%"), ":~:.")<CR>
nmap <leader>cl :let @+=expand("%:p")<CR>

" Move lines in visual mode
vnoremap <up>   :m '<-2<CR>gv=gv
vnoremap <down> :m '>+1<CR>gv=gv

map <leader>f :Files<cr>
map <leader>F :Rg<cr>

" List buffers and set up for switch
nnoremap <leader>B :Buffers<CR>
nnoremap <leader>b :Buffers<CR>

" Specify the behavior when switching between buffers 
set switchbuf=useopen,usetab,newtab
set stal=2

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=%m\[%r%{getcwd()}%h]%=%f\ %P\ [%c]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    " autocmd BufRead,BufNewFile *.txt set wrap
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>sm Go<enter><esc>iif __name__ == '__main__':<enter>main()<esc><c-o>
nnoremap <leader>sd oimport pdb; pdb.set_trace()<esc>0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for notes
map <leader>m :e ~/notes.md<cr>

" Use Linux system clipboard as default clipboard
set clipboard=unnamedplus

" Auto-reload .vimrc, when modifying and saving .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

map <leader>R :e $MYVIMRC <CR>

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

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'benmills/vimux'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Vimjas/vim-python-pep8-indent'

" Plugin settings

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

map <silent> <leader>G :Goyo<CR>
let g:goyo_width = 80
let g:goyo_height = 80

let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_default_coefficient = 0.5
map <leader>L :Limelight!!<CR>

function! s:goyo_enter()
   silent !tmux set status off
   silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
   hi StatusLineNC ctermfg=white
   " set noshowmode
   " set noshowcmd
   " set laststatus=0
   " set scrolloff=999
   Limelight
endfunction

function! s:goyo_leave()
   silent !tmux set status on
   silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
   " Toggle gaps?
   " set showmode
   " set showcmd
   " set laststatus=2
   " set scrolloff=7
   set background=dark
   call s:patchColors()
   Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Run the current file with rspec
map <Leader>vp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
map <Leader>vt :call VimuxRunCommand("clear; pytest " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vc :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" let g:fzf_preview_window = ['up:40%:hidden', 'Tab']

let $FZF_DEFAULT_OPTS="--ansi --inline-info --preview-window 'right:50%:hidden' --layout reverse --margin=0,0 --bind='Tab:toggle-preview'"
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"

" Reducing ESC delay can make fzf unable to read keys with ALT modifier on some terminals
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
set ttimeoutlen=0

" Default settings for coc (https://github.com/neoclide/coc.nvim)
" source $HOME/.vim/coc.vim

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
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
