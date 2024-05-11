# Load environment variables
. "$HOME/.config/shell/env.sh"

# Load the correct RC file for the current shell
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && [ -f "$ZDOTDIR/.zshrc" ] && . "$ZDOTDIR/.zshrc"

# Start an X session if one doesn't already exist
[ "$(tty)" = '/dev/tty1' ] && (pgrep "$WM" || startx "$XDOTDIR/.xinitrc")
