" Fugitive settings

function! ToggleGStatus()
  if buflisted(bufname('fugitive'))
    bd fugitive
  else
    Git
    15wincmd_
  endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

augroup fugitive_au
  autocmd!
  autocmd FileType fugitive setlocal winfixheight
augroup END

nnoremap <silent> <leader>gg :ToggleGStatus<cr>
nnoremap <silent> <leader>gb :Git blame<cr>
