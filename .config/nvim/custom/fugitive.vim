" Fugitive settings

function! ToggleGStatus()
  if bufloaded(bufname('fugitive*.git//'))
    bw fugitive*.git//
  else
    Git
    15wincmd_
  endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

augroup fugitive_au
  autocmd!
  autocmd FileType fugitive setlocal winfixheight
  autocmd BufReadPost fugitive*.git// set nobuflisted
augroup END

nnoremap <silent> <leader>gg :ToggleGStatus<cr>
nnoremap <silent> <leader>gb :Git blame<cr>
