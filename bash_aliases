# Colorized prompt

GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true # * unstaged, + staged
GIT_PS1_SHOWSTASHSTATE=true # $ stashed
GIT_PS1_SHOWUNTRACKEDFILES=true # % untracked
GIT_PS1_SHOWUPSTREAM="auto" # < behind, > ahead, <> diverged, = same as upstream

function set_prompt() {
    local LastCommandResult=$1
    local TimeElapsed=$2

    Black='\[\e[30;1m\]'
    Red='\[\e[31;1m\]'
    Green='\[\e[32;1m\]'
    Yellow='\[\e[33;1m\]'
    Blue='\[\e[34;1m\]'
    Purple='\[\e[35;1m\]'
    Cyan='\[\e[36;1m\]'
    White='\[\e[37;1m\]'

    Gray='\[\e[37;0m\]'

    OnRed='\[\e[41m\]'
    OnGreen='\[\e[42m\]'
    OnYellow='\[\e[43m\]'
    OnBlue='\[\e[44m\]'
    OnWhite='\[\e[47m\]'
    OnGray='\[\e[100m\]'

    Reset='\[\e[00m\]'

    Checkmark='\342\234\223'
    BallotX='\342\234\227'

    PS1=""

    if [[ $LastCommandResult == 0 ]]; then
        PS1+="$Green$OnGreen OK $Gray$OnGray ${TimeElapsed}s $Reset "
    else
        PS1+="$Red$OnRed E$LastCommandResult $Gray$OnGray ${TimeElapsed}s $Reset "
    fi

    if [[ $UID != 0 ]]; then
        PS1+="$Green\u@$Red\h$Reset:$Blue\w$Reset`__git_ps1 2>/dev/null`$Reset\n\\$ "
    else
        PS1+="$Red\u@$Red\h$Reset:$Blue\w$Reset`__git_ps1 2>/dev/null`$Reset\n\\# "
    fi
}

function pre_command() {
    if [ -z "$ON_FIRST_COMMAND" ]; then
        return
    fi
    unset ON_FIRST_COMMAND

    FIRST_COMMAND_BEGIN=`date +%s.%3N`
}

function post_command() {
    local LAST_COMMAND_RESULT=$?
    local LAST_COMMAND_END=`date +%s.%3N`

    ON_FIRST_COMMAND=1
    if [ -n "$ON_FIRST_PROMPT" ]; then
        unset ON_FIRST_PROMPT
        return
    fi

    local TIME_ELAPSED=$(bc <<< "$LAST_COMMAND_END - $FIRST_COMMAND_BEGIN")

    set_prompt $LAST_COMMAND_RESULT $TIME_ELAPSED
}

trap "pre_command" DEBUG
PROMPT_COMMAND="post_command"
ON_FIRST_PROMPT=1
set_prompt 0 .000

# path to scripts
export PATH="$HOME/1-linux/scripts.public:$PATH"
export PATH="$HOME/1-linux/scripts.private:$PATH"
export PATH="$HOME/1-linux/scripts.yandex:$PATH"
export PATH="$HOME/0-linux/scripts:$PATH"

# screen
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

# find
alias find-name="find . -name"

# less
export LESS='-R'
if which pygmentize &>/dev/null; then
    export LESSOPEN='|pygmentize -g %s'
fi

# svn
alias svn-st-grep="svn st | grep \"^[^?]\""

# Yandex
ARCADIA="$HOME/arcadia"
if [ -f "$ARCADIA/junk/pmatsula/dotfiles/bash_aliases" ]; then
    . "$ARCADIA/junk/pmatsula/dotfiles/bash_aliases"
fi
