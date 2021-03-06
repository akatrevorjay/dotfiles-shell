## auto-fu.zsh stuff.
# source ~/.shell/zsh-plugged/repos/b4b4r07/auto-fu.zsh
#{ . "$SHELL_CONF_DIR/zsh-plugged/repos/b4b4r07/auto-fu.zsh/auto-fu"; auto-fu-install; }
zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=black,bold
zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
zstyle ':auto-fu:var' postdisplay $'\n-azfu-'
zstyle ':auto-fu:var' track-keymap-skip opp
zle-line-init () {auto-fu-init;}; zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select
