ZSH=${HOME}/.zsh
# Path to your oh-my-zsh configuration.

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#load config files
source ~/.zshenv

for config_file ($ZSH/lib/*.zsh); do
    source $config_file
done

#load plugins
plugins=(zsh-syntax-highlighting vi-mode history-substring-search)
for plugin ($plugins); do
    fpath=($ZSH/plugins/$plugin $ZSH/functions $ZSH/completions $fpath)
done

autoload -U compinit
compinit -i

for plugin ($plugins); do
    source $ZSH/plugins/$plugin.plugin.zsh
done

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

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus


#aliases and bindings
bindkey "^R" history-incremental-search-backward
alias ...='cd ../..'
alias _='sudo'
alias g='git'
alias gs='git status -s'
alias gds='git diff --stat'
alias gdcs='git diff --cached --stat'
alias gd='git diff'
alias gpom='git push origin master'
alias glom='git pull origin master'
alias gc='git commit'
alias ga='git add'
alias gaa='git add -a'
alias di='du -h --max-depth=1 .'
alias m='ssmtp finlaymaguire@gmail.com'

# options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export EDITOR=/usr/bin/vim


# Customize to your needs...
export CC=gcc
export CXX=g++
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/jre/
export PATH=usr/local/bin:/usr/bin:/bin:/opt/mpich/bin:/opt/anaconda/bin:/usr/local/src/p4Hg/bin:/usr/lib/jvm/java-7-openjdk/jre/bin:/usr/local/MATLAB/R2014a/bin
export PYTHONPATH=/home/fin/anaconda/lib:/usr/lib/python2.7/site-packages
export PYTHONHOME=/home/fin/anaconda
export TERMINAL=konsole
export LD_LIBRARY_PATH=/usr/local/lib:/opt/mpich/lib


DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus


function lt() { ls -ltrha "$@" | tail; } 
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function mcd() { mkdir $1 && cd $1; }

stty icrnl
