" Vimux settings

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
