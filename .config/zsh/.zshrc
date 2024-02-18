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
source "$XDG_CONFIG_HOME/shell/aliases.sh"
source "$XDG_CONFIG_HOME/shell/colors.sh"

# Plugins
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
