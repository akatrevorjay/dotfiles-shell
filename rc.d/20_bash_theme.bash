#!/bin/bash

[[ ! -e "$HOME/code/github/bashism/bashism.d/colors.sh" ]] \
  || . "$HOME/code/github/bashism/bashism.d/colors.sh"

# PS theming
function bash_theme {
    local THEME=$1
    [ -z "$THEME" ] && THEME=proml
    local p=; for p in "$HOME/.bash/themes" {"$HOME/.","/etc/"}bash_themes; do
        local q=; for q in "$p/$THEME.sh" "$p/$THEME-$USER.sh"; do
            if [[ -e "$q" ]]; then
                . "$q"
                declare -F -f "$THEME" >/dev/null 2>&1 && "$THEME"

                if [[ -f "$p/${THEME}.dircolors" ]]; then
                    eval `dircolors -b "$p/${THEME}.dircolors"`
                elif [[ -f "$HOME/.dircolors" ]]; then
                    eval `dircolors -b "$HOME/.dircolors"`
                fi

                # Glue prompt to first column
                export PS1="\[\033[G\]$PS1"

                unset PS1_PRE PS1_POST
                break 2
            fi
        done
    done
}