# Path to your zsh config.
ZSH=${HOME}/.zsh

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#load config files
source ~/.zshenv

#load plugins
plugins=(zsh-syntax-highlighting vi-mode history-substring-search)

for plugin ($plugins); do
    fpath=($ZSH/plugins/$plugin $ZSH/functions $ZSH/completions $fpath)
done

for config_file ($ZSH/lib/*.zsh); do
    source $config_file
done

for plugin ($plugins); do
    source $ZSH/plugins/$plugin.plugin.zsh
done

autoload -U compinit
compinit -i

source $ZSH/fin.zsh-theme

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

## prevent overwriting by redirect
setopt NOCLOBBER 

function lt() { ls -ltrha "$@" | tail; } 
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function mcd() { mkdir $1 && cd $1; }

stty icrnl
