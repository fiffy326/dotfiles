HISTSIZE=100000
SAVEHIST=100000

# Colored prompt
autoload -Uz promptinit && promptinit
prompt fade blue

# Shell options
setopt appendhistory autocd beep extendedglob nomatch notify

# Use vim keybinds
bindkey -v

# Completions
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Shell-independent files
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/colors"

# Plugins
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'

# vim:set ts=4 sts=4 sw=4:
