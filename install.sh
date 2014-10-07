#!/usr/bin/zsh

mkdir -p ~/.dotfile_backups

dot_files=(Xresources xinitrc i3status.conf i3 zshenv zlogin zlogout zshrc zsh vimrc vim irssi gitconfig)

for i in "${dot_files[@]}"
do
    echo "Backing up existing $i to ~/.dotfile_backups"
    if [ -e ~/.$i ]
        then 
            mv ~/.$i ~/.dotfile_backups/$i
    fi
	echo "Symlinking git repo $i to ~/"
	ln -s $PWD/$i ~/.$i
done

source ~/.zshrc
mkdir -p ~/.cache/zsh
xrdb ~/.Xresources
i3 restart
