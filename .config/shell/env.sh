# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS='/usr/local/share:/usr/share'
export XDG_CONFIG_DIRS='/etc/xdg'

# XDG user directories
XDG_DESKTOP_DIR="$(xdg-user-dir DESKTOP)"
XDG_DOCUMENTS_DIR="$(xdg-user-dir DOCUMENTS)"
XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
XDG_MUSIC_DIR="$(xdg-user-dir MUSIC)"
XDG_PICTURES_DIR="$(xdg-user-dir PICTURES)"
XDG_PUBLICSHARE_DIR="$(xdg-user-dir PUBLICSHARE)"
XDG_TEMPLATES_DIR="$(xdg-user-dir TEMPLATES)"
XDG_VIDEOS_DIR="$(xdg-user-dir VIDEOS)"
export                  \
    XDG_DESKTOP_DIR     \
    XDG_DOCUMENTS_DIR   \
    XDG_DOWNLOAD_DIR    \
    XDG_MUSIC_DIR       \
    XDG_PICTURES_DIR    \
    XDG_PUBLICSHARE_DIR \
    XDG_TEMPLATES_DIR   \
    XDG_VIDEOS_DIR

# Add directories to the $PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/utilities"
export PATH="$PATH:$HOME/.local/bin/app-wrappers"

# XDG compliance workarounds
export HISTFILE="$XDG_STATE_HOME/shell/history"
export XDOTDIR="$XDG_CONFIG_HOME/X11"
export XINITRC="$XDOTDIR/.xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
export MATLAB_LOG_DIR="$XDG_CACHE_HOME/matlab"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# Allow GNOME sessions to login
if [ "$XDG_SESSION_DESKTOP" != "gnome" ]; then
	export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
fi

# Fix Java application rendering problems in dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# Get the current login shell
login_shell="$(getent passwd "$USER" | awk -F: '{print $7}')"

# Shell history size
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=100000

# Program preferences
export WM='dwm'
export SHELL="$login_shell"  # Login shell
export SXHKD_SHELL='/bin/sh' # System shell
export TERMINAL='st'
export BROWSER='firefox'
export OPENER='xdg-open'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Colored manpages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT='-c'

# Appearance preferences
export WALLPAPER='/home/emma/Pictures/wallpapers/cat-waves.png'
export PYWAL_THEME='base16-materialer'
export PYWAL_BG_COLOR='#212121'
export BAT_THEME='Catppuccin-macchiato'
export GTK_THEME='Adwaita:dark'
export GTK2_RC_FILES='/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc'
export QT_STYLE_OVERRIDE='Adwaita-dark'

# MAC addresses for bluetooth devices
export HEADPHONES_NEW='AC:80:0A:22:5C:D4'
export HEADPHONES_OLD='F8:4E:17:6A:EB:87'

# Export environment variables
dbus-update-activation-environment --systemd --all
