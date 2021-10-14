# My dotfiles
Apply with

    stow .

# TODO
* Make Telescope find_files respect .gitignore AND show hidden files
* Replace fzf with telescope if possible?
* Fix GUI colors not working correctly in urxvt outside of tmux
* Make some hide/show functionality in vim using mksession (https://vi.stackexchange.com/questions/241/how-to-undo-revert-making-current-window-the-only-window-only-c-w-o)
* Toggle short/long path in galaxyline and Telescope

# Links
* [Slim vimrc](https://github.com/leeren/dotfiles/blob/master/vim/.vim/vimrc)
* [Galaxyline inspiration](https://github.com/MagicDuck/dotfiles/blob/master/.config/nvim/lua/my/galaxyline/init.lua)

* [GalaxyLine makes splash screen disappear](https://github.com/glepnir/galaxyline.nvim/issues/107)
* [Neovide pre-built not working](https://github.com/Kethku/neovide/issues/643)
* [Neovide problems with floating windows](https://github.com/neovide/neovide/issues/720)
  * [Temporary fix](https://github.com/neovide/neovide/issues/512#issuecomment-829908208)
* [NeoVim lazy redraw problems](https://github.com/neovim/neovim/issues/11806)

# Note
Idea was to apply all these dotfiles with:

	stow --dotfiles .

But due to a bug (https://github.com/aspiers/stow/issues/33) that does not work for dot-directories.

Problem avoided by naming dotfiles normally. (.bashrc instead of dot-bashrc etc)
