#!/usr/bin/zsh

mv ~/.vimrc ~/.vimrc_backup
mv ~/.i3status.conf ~/.i3status.conf_backup
mv ~/.i3 ~/.i3_backup
mv ~/.zshrc ~/.zshrc_backup
mv ~/.zsh ~/.zsh_backup
mv ~/.Xresources ~/.Xresources_backup
mv ~/.irssi ~/.irssi_backup

ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/i3status.conf ~/.i3status.conf
ln -s $PWD/i3 ~/.i3
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/zsh ~/.zsh
ln -s $PWD/Xresources ~/.Xresources
ln -s $PWD/irssi ~/.irssi

xrdb ~/.Xresources
i3 restart
source ~/.zshrc
