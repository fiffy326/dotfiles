# If not running interactively, do nothing
[[ $- != *i* ]] && return

HISTSIZE=100000
HISTFILESIZE=100000

# Colored prompt
PS1='\[\e[97;1m\][\[\e[38;5;147m\]\u\[\e[97m\]@\[\e[38;5;153m\]\h \[\e[0;97m\]\W\[\e[97;1m\]]\[\e[97m\]\$ \[\e[0m\]'

# Shell options
shopt -s autocd globstar histappend

# Shell-independent files
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/colors"

# Plugins
[[ -f '/usr/share/bash-preexec/bash-preexec.sh' ]] && source '/usr/share/bash-preexec/bash-preexec.sh'

# vim:set ts=4 sts=4 sw=4:
