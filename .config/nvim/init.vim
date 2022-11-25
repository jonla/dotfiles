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
source ~/.config/nvim/neovide.vim
source ~/.config/nvim/files.vim

" Plugin settings
source ~/.config/nvim/plugged.vim
source ~/.config/nvim/limelight.vim
source ~/.config/nvim/goyo.vim
source ~/.config/nvim/vimux.vim
" source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/nvim-tree.vim
source ~/.config/nvim/fugitive.vim
" source ~/.config/nvim/airline.vim
" source ~/.config/nvim/quickscope.vim
lua require('telescope-settings')
lua require('devicons-settings')
lua require('galaxyline-settings')
lua require('bufferline-settings')
lua require('nvim-toggleterm-settings')

" Source colors last
source ~/.config/nvim/colors.vim
