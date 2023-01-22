" Sneak stuff

let g:sneak#s_next=1
highlight Sneak gui=italic
" vim.cmd("highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow")

" To disable highlighting:  
" vim.cmd("highlight link Sneak None")
" Needed if a plugin sets the colorscheme dynamically:
" autocmd User SneakLeave highlight clear Sneak
