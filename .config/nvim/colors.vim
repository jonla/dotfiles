" Color settings

" Use GUI colors
set termguicolors

" Customize some highlights
function! s:patchColors()
    hi clear vertsplit
    hi clear SignColumn
    hi StatusLine                               guibg=None gui=None
    hi StatusLineNC                             guibg=None gui=None
    hi LineNr                  ctermfg=gray     guifg=#404040
    if (exists("g:neovide") == 0)
        hi Normal                               guibg=None
    endif
    hi GitGutterAdd            ctermbg=None     guibg=None
    hi GitGutterChange         ctermbg=None     guibg=None
    hi GitGutterDelete         ctermbg=None     guibg=None
    hi GitGutterChangeDelete   ctermbg=None     guibg=None
    hi CocWarningSign          ctermbg=None     guibg=None
    hi Comment                 cterm=italic     gui=italic
    hi QuickScopePrimary       cterm=underline  gui=underline
endfunction

autocmd! ColorScheme * call s:patchColors()

" Set the actual colorscheme
colorscheme gruvbox

call s:patchColors()
