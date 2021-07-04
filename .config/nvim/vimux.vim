" Vimux settings

" Run the current file with rspec
nnoremap <Leader>vp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
nnoremap <Leader>vt :call VimuxRunCommand("clear; pytest " . bufname("%"))<CR>

" Prompt for a command to run
nnoremap <Leader>vc :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
nnoremap <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
