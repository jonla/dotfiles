# My dotfiles
Apply with

    stow .

# TODO
Idea was to apply all these dotfiles with:

	stow --dotfiles .

But due to a bug (https://github.com/aspiers/stow/issues/33) that does not work for dot-directories.

Problem avoided by naming dotfiles normally. (.bashrc instead of dot-bashrc etc)
