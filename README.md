# My dotfiles
Apply with

    stow .

# TODO
* Make Telescope find_files respect .gitignore AND show hidden files
* Replace fzf with telescope if possible?
* Fix GUI colors not working correctly in urxvt outside of tmux

# Links
* [Slim vimrc](https://github.com/leeren/dotfiles/blob/master/vim/.vim/vimrc)
* [Galaxyline inspiration](https://github.com/MagicDuck/dotfiles/blob/master/.config/nvim/lua/my/galaxyline/init.lua)

* [GalaxyLine makes splash screen disappear](https://github.com/glepnir/galaxyline.nvim/issues/107)
* [Neovide pre-built not working](https://github.com/Kethku/neovide/issues/643)
* [Neovide catching unintended keystrokes](https://github.com/Kethku/neovide/issues/826)
  * [Also discussed here](https://github.com/neovide/neovide/issues/763)

# Note
Idea was to apply all these dotfiles with:

	stow --dotfiles .

But due to a bug (https://github.com/aspiers/stow/issues/33) that does not work for dot-directories.

Problem avoided by naming dotfiles normally. (.bashrc instead of dot-bashrc etc)
