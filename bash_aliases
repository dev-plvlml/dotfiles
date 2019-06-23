# Colorized prompt

set_prompt() {
    LastCommand=$?

    Red='\[\e[31;1m\]'
    Green='\[\e[32;1m\]'
    Yellow='\[\e[33;1m\]'
    Blue='\[\e[34;1m\]'
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
    FancyX='\342\234\227'
    RightAngleBracket='\342\214\252'

    PS1=""

    if [[ $LastCommand == 0 ]]; then
        PS1+="$Green$OnGreen\A$Reset "
    else
        PS1+="$Red$OnRed\A$Reset "
    fi

    if [[ $UID != 0 ]]; then
        PS1+="$Green\u@$Red\h$Reset:$Blue\w$Reset\n\\$ "
    else
        PS1+="$Red\u@$Red\h$Reset:$Blue\w$Reset\n\\# "
    fi
}

PROMPT_COMMAND='set_prompt'

# path to scripts
export PATH="$HOME/1-linux/scripts.public:$PATH"
export PATH="$HOME/1-linux/scripts.private:$PATH"
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
