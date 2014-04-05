# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

#load config files
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

#source /opt/intel/bin/compilervars.sh intel64

#aliases and bindings
bindkey "^R" history-incremental-search-backward
alias ...='cd ../..'
alias _='sudo'

# options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Customize to your needs...
export PATH=/opt/anaconda/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/src/p4Hg/bin
export PYTHONPATH=/usr/local/src/p4Hg/
export CC=gcc
export CXX=g++

