" Goyo settings

map <silent> <leader>G :Goyo<CR>
let g:goyo_width = 80
let g:goyo_height = 80

function! s:goyo_enter()
   silent !tmux set status off
   silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
   Limelight
endfunction

function! s:goyo_leave()
   silent !tmux set status on
   silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
   Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
