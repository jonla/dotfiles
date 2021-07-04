"                 __
"  __          __/\ \__               __
" /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
" \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"  \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"   \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"    \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/

source ~/.config/nvim/general.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/snippets.vim

" Plugin settings
source ~/.config/nvim/plugged.vim
source ~/.config/nvim/limelight.vim
source ~/.config/nvim/goyo.vim
source ~/.config/nvim/vimux.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/quickscope.vim
lua require('telescope-settings')
lua require('devicons-settings')

" Set custom colors 
function! s:patchColors()
    hi clear vertsplit
    hi LineNr                  ctermfg=238
    hi CursorLine                                ctermbg=237       cterm=None
    hi clear SignColumn
    hi clear FoldColum
    hi GitGutterAdd            ctermfg=Green     ctermbg=None
    hi GitGutterChange         ctermfg=DarkGray  ctermbg=None
    hi GitGutterDelete         ctermfg=Red       ctermbg=None
    hi GitGutterChangeDelete   ctermfg=Red       ctermbg=None
    hi EndOfBuffer             ctermfg=237
    hi Pmenu                   ctermfg=DarkGray  ctermbg=236
    hi PmenuSel                ctermfg=Red       ctermbg=237       cterm=bold
    hi PmenuSbar               ctermfg=Blue      ctermbg=236
    hi PmenuThumb              ctermfg=Yellow    ctermbg=236
    hi ErrorMsg                ctermfg=Black     ctermbg=Red
    hi Error                   ctermfg=Black     ctermbg=Red
    hi ColorColumn             ctermfg=Black     ctermbg=Red
    hi Comment                                                     cterm=italic
endfunction

autocmd! ColorScheme * call s:patchColors()
call s:patchColors()
