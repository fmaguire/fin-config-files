#!/usr/bin/zsh

mkdir -p ~/.dotfile_backups

dot_files=(xinitrc i3status.conf i3 zshenv zshrc zsh vimrc vim gitconfig tmux.conf)

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
i3 restart
