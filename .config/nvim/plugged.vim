" Plugins

call plug#begin('~/.config/nvim/plugged')

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'wellle/tmux-complete.vim'
    Plug 'benmills/vimux'
    Plug 'airblade/vim-gitgutter'
    Plug 'morhetz/gruvbox'
    " Plug 'scrooloose/nerdtree'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'vim-airline/vim-airline'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'unblevable/quick-scope'
    " Telescope  and requirements
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()
