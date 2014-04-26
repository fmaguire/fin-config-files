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

