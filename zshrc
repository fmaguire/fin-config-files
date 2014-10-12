# Path to your zsh config.
ZSH=${HOME}/.zsh

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#load config files
source ~/.zshenv

cat $ZSH/todo.txt

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

#chpwd() {
#  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
#}

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

function extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}




stty icrnl
