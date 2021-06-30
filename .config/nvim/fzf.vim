" Fzf settings

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

" Mappings
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Rg<cr>
nnoremap <leader>H :History<cr>
nnoremap <leader>b :Buffers<CR>
