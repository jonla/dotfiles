# My dotfiles
Apply with
    stow .

# TODO
* Clean config/i3/config from outdated settings

Idea was to apply all these dotfiles with:
	stow --dotfiles .
But due to a bug (https://github.com/aspiers/stow/issues/33) that does not work for dot-directories.

Problem avoided by naming dotfiles normally. (.bashrc instead of dot-bashrc etc)
