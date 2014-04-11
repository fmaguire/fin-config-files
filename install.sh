#!/usr/bin/zsh

mkdir -p ~/.dotfile_backups

dot_files=(Xresources xinitrc i3status.conf i3 zshrc zsh vimrc vim irssi)

for i in "${dot_files[@]}"
do
    echo "Backing up existing $i to ~/.dotfile_backups"
    mv ~/.$i ~/.dotfile_backups/$i
	echo "Symlinking git repo $i to ~/"
	ln -s $PWD/$i ~/.$i
done

xrdb ~/.Xresources
i3 restart
source ~/.zshrc
