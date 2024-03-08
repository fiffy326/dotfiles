# Config editing helpers
alias edit-env='$EDITOR $XDG_CONFIG_HOME/shell/env.sh'
alias edit-xinitrc='$EDITOR $XDOTDIR/.xinitrc'
alias edit-xresources='$EDITOR $XDOTDIR/.Xresources'
alias edit-xmodmap='$EDITOR $XDOTDIR/.Xmodmap'
alias edit-profile='$EDITOR $XDG_CONFIG_HOME/shell/profile.sh'
alias edit-aliases='$EDITOR $XDG_CONFIG_HOME/shell/aliases.sh'
alias edit-keybinds='$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc'
alias edit-bashrc='$EDITOR $XDG_CONFIG_HOME/bash/.bashrc'
alias edit-zshrc='$EDITOR $ZDOTDIR/.zshrc'

# System helpers
alias update-initramfs='sudo mkinitcpio -P'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias update-xresources='xrdb -remove * && xrdb -load $XDOTDIR/.Xresources'

# Dotfile repo helpers
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dotfiles-list='dotfiles ls-tree -r main --name-only | sort'

# Pass aliases thru sudo
alias sudo='sudo '

# Format a C/C++ file
alias cformat='clang-format --style=file'

# Colored command output
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias eza='eza					\
	--sort=name                 \
	--icons=always				\
	--smart-group				\
	--octal-permissions			\
	--no-quotes                 \
	--group-directories-first'

# Turn off the display
alias goodnight="xset dpms force off"

# Start Discord archive tunnel
alias dcef-tunnel="ssh -p 35616 -i ~/.ssh/id_rsa -N -T -R 1337:localhost:21011 emma@trannersanctuary.com"

# Command shortcuts
alias l='eza'
alias ll='eza --long'
alias la='eza --all'
alias lla='eza --long --all'
alias nv='nvim'
alias vim='nvim'
alias calc='qalc'
alias fetch='fastfetch'
alias feh='feh -Tslideshow'
alias colorpicker='colorpicker --one-shot --short --preview'
alias iftop='sudo iftop -i wlp8s0'

# XDG compliance workarounds
alias wget='wget --hsts-file=$XDG_DATA_HOME/wget-hsts'
