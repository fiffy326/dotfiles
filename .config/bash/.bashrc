# If not running interactively, do nothing
[[ $- != *i* ]] && return

# Colored prompt
PS1='\[\e[97;1m\][\[\e[38;5;147m\]\u\[\e[97m\]@\[\e[38;5;153m\]\h \[\e[0;97m\]\W\[\e[97;1m\]]\[\e[97m\]\$ \[\e[0m\]'

# Shell options
shopt -s autocd checkwinsize globstar histappend

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Shell-independent files
. "$XDG_CONFIG_HOME/shell/aliases.sh"
. "$XDG_CONFIG_HOME/shell/colors.sh"

# Enable bash-preexec plugin
[[ -f '/usr/share/bash-preexec/bash-preexec.sh' ]] &&\
    . '/usr/share/bash-preexec/bash-preexec.sh'

# Enable bash-completion plugin
if ! shopt -oq posix; then
    if [ -f '/usr/share/bash-completion/bash_completion' ]; then
        . '/usr/share/bash-completion/bash_completion'
    elif [ -f '/etc/bash_completion' ]; then
        . '/etc/bash_completion'
    fi
fi
