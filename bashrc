#!/bin/bash

## Don't load anything else if we're not interactive
# This actually doesn't work correctly, doesn't return on rsync for instance.
#shopt -oq posix && return
[ -z "$PS1" ] && return

## ~/.bash rc.d and completion.d and "-local"s
for i in "$HOME/.bash/"{rc,completion,aliases}".d/"* "$HOME/.bash/"{rc,completion,aliases}".d-local/"*; do
    [[ -x "$i" || -h "$i" ]] && . "$i"
done