export EDITOR=vim
export PYTHONPATH=/opt/anaconda/bin:/usr/local/src/p4Hg/
export TERMINAL=konsole
export CC=gcc
export CXX=g++
export JAVA_HOME=/opt/java/64_bit/oracle/jre1.7.0_65/
export PATH=${JAVA_HOME}/bin:usr/local/bin:/opt/anaconda/bin:/usr/bin:/bin:/usr/lib/jvm/java-7-openjdk/jre/bin:/usr/local/MATLAB/R2014a/bin

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

