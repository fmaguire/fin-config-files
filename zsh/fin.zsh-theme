# ZSH Theme - Preview: http://dl.dropbox.com/u/4109351/pics/gnzh-zsh-theme.png
# Based on bira theme

# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

# Check the UID

if [[ $UID -eq 0 ]]; then # root
  eval PR_USER='%{$PR_RED$PR_BOLD%}%n%{$PR_NO_COLOR%}'
  local PR_PROMPT='%{$PR_RED$PR_BOLD%}➤%{$PR_NO_COLOR%} '
else # normal user
  eval PR_USER='%{$PR_GREEN$PR_BOLD%}%n%{$PR_NO_COLOR%}'
  local PR_PROMPT='%{$PR_NO_COLOR%}➤ '
fi

if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    eval PR_HOST='%{$PR_YELLOW$PR_BOLD%}%M%{$PR_NO_COLOR%}' #SSH
else
    eval PR_HOST='%{$PR_GREEN$PR_BOLD%}%M%{$PR_NO_COLOR%}' # no SSH
fi

local return_code="%(?..%{$PR_RED%}%? ↵%{$PR_NO_COLOR%})"

local user_host='${PR_USER}%{$PR_BLUE%}@${PR_HOST}'
local current_dir='%{$PR_BOLD$PR_BLUE%}${PWD/#$HOME/~}%{$PR_NO_COLOR%}'

# The time


local p_time="%{$PR_BOLD%}%D|%*%{$PR_NO_COLOR%}"




GIT_BRANCH_COLOR="%{$PR_BLUE$PR_BOLD%}"
GIT_CLEAN_COLOR="%{$PR_GREEN$PR_BOLD%}"
GIT_DIRTY_COLOR="%{$PR_RED$PR_BOLD%}"
GIT_UNTRACKED_COLOR="%{PR_YELLOW$PR_BOLD%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX=": $GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
#ZSH_THEME_GIT_PROMPT_UNTRACKED=" ${GIT_UNTRACKED_COLOR}?"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✗"

PROMPT="
%{$PR_BLUE%}╭─<${user_host}%{$PR_BLUE%}>-<${current_dir}%{$PR_BLUE%}$(git_prompt_info)%{$PR_BLUE%}>-<${p_time}%{$PR_BLUE%}>
%{$PR_BLUE%}╰─$PR_PROMPT"
RPS1="${return_code}"


REPORTTIME=10

zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        echo -ne "\033]12;Red\007"
        else
            echo -ne "\033]12;Grey\007"
            fi
}
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    echo -ne "\033]12;Grey\007"
}
zle -N zle-line-init

