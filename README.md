# My dotfiles
Apply with

    stow .

# TODO
* Make Telescope find_files respect .gitignore AND show hidden files
* Replace fzf with telescope if possible?
* Galaxyline inspiration from https://github.com/MagicDuck/dotfiles/blob/master/.config/nvim/lua/my/galaxyline/init.lua

# Quirks
* GUI colors not working correctly in urxvt outside of tmux
* Why does galaxyline remove vim splash screen?
    * https://github.com/glepnir/galaxyline.nvim/issues/107

# Note
Idea was to apply all these dotfiles with:

	stow --dotfiles .

But due to a bug (https://github.com/aspiers/stow/issues/33) that does not work for dot-directories.

Problem avoided by naming dotfiles normally. (.bashrc instead of dot-bashrc etc)
