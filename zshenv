export EDITOR=vim
export PYTHONPATH=/opt/anaconda/bin:/usr/local/src/p4Hg/
export TERMINAL=konsole
export CC=gcc
export CXX=g++
export JAVA_HOME=/opt/java/64_bit/oracle/jre1.7.0_65/
export PATH=${JAVA_HOME}/bin:usr/local/bin:/opt/anaconda/bin:/usr/bin:/bin:/usr/lib/jvm/java-7-openjdk/jre/bin:/usr/local/MATLAB/R2014a/bin

#aliases and bindings
bindkey "^R" history-incremental-search-backward

alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

alias ls="ls -1p --color=auto"
alias l="ls -lhGgo"
alias ll="ls -lh"
alias la="ls -lhGgoA"
alias lt="ls -lhGgotr"
alias lS="ls -lhGgoSr"
alias l.="ls -lhGgod .*"
alias lhead="ls -lhGgo | head"
alias ltail="ls -lhGgo | tail"
alias lmore='ls -lhGgo | more'

alias cuts="cut -d \" \""
alias cutc="cut -d \",\""


alias tarup="tar -zcf"
alias tardown="tar -zxf"

alias u="cd ..;ls"
alias refresh="source ~/.zshrc"

alias _='sudo'
alias mtlb='matlab -nodisplay'
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
