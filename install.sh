#!/bin/bash

XDG_CONFIG_HOME="$HOME/.config"
DOTFILES="$HOME/dotfiles"
XDG_DATA_HOME="$HOME/.config/local/share"

########
# nvim #
########

rm -rf "$XDG_CONFIG_HOME/nvim"
ln -s "$DOTFILES/nvim" "$XDG_CONFIG_HOME"

#########
# emacs #
#########

ln -sf "$DOTFILES/emacs/init.el" "$HOME/.emacs.d"
ln -sf "$DOTFILES/emacs/custom-file.el" "$HOME/.emacs.d"
ln -sf "$DOTFILES/emacs/signature" "$HOME/.emacs.d/"
ln -sf "$DOTFILES/emacs/notmuch-config" "$HOME/.notmuch-config"

#########
# nvims #
#########

#rm -rf "$XDG_CONFIG_HOME/nvims"
#ln -s "$DOTFILES/nvims" "$XDG_CONFIG_HOME"

# nvim related stuffs
####################

#rm -rf "$XDG_CONFIG_HOME/mdl"
#ln -s "$DOTFILES/nvim-stuffs/mdl" "$XDG_CONFIG_HOME"
#ln -sf "$XDG_CONFIG_HOME/mdl/.mdlrc" "$HOME/"
#ln -sf "$DOTFILES/nvim-stuffs/.editorconfig" "$HOME/"
#ln -sf "$DOTFILES/nvim-stuffs/.luacheckrc" "$HOME/"
ln -sf "$DOTFILES/nvim-stuffs/.markdownlintrc" "$HOME/"
#ln -sf "$DOTFILES/nvim-stuffs/.shellcheckrc" "$HOME/"

################
# Other Stuffs #
################

#ln -sf "$DOTFILES/other-stuffs/.nbrc" "$HOME/"
#ln -sf "$DOTFILES/other-stuffs/starship.toml" "$HOME/.config/"
ln -sf "$DOTFILES/other-stuffs/chromium-flags.conf" "$XDG_CONFIG_HOME"
ln -sf "$DOTFILES/other-stuffs/mimeapps.list" "$XDG_CONFIG_HOME"

######
# nb #
######

#rm -rf "$HOME/.nb"
#ln -s "$HOME/shared/Workspace/Zk-nb" "$HOME/.nb"

#######
# X11 #
#######

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"
ln -sf "$DOTFILES/X11/.xinitrc" "$HOME/"

######
# i3 #
######

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

#######
# Zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#########
# dunst #
#########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

#########
# picom #
#########

#mkdir -p "$XDG_CONFIG_HOME/picom"
#ln -sf "$DOTFILES/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"

########
# tmux #
########

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

rm -rf "$XDG_CONFIG_HOME/tmuxp"
ln -s "$DOTFILES/tmuxp" "$XDG_CONFIG_HOME"

[ ! -d "$XDG_CONFIG_HOME/tmux/plugins" ] &&
git clone https://github.com/tmux-plugins/tpm \
	"$XDG_CONFIG_HOME/tmux/plugins/tpm"
