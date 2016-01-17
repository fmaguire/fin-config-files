export EDITOR=vim
export TERMINAL=st
export TERM=st
export CC=gcc
export CXX=g++
export CUDA_HOME=/opt/cuda
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

export PATH=/opt/cuda/bin:usr/local/bin:/usr/bin:/bin
#aliases and bindings
bindkey "^R" history-incremental-search-backward


alias ls="ls -1p --color=auto"
alias l="ls -lhGgo"
alias ll="ls -lh"

alias u="cd ..;ls"
alias refresh="source ~/.zshrc"

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

alias grep='grep --color=auto'
