#!/bin/zsh
#Zsh so we can do custom sorting w/o an external dependency.

SOURCES=($HOME/(.dotfiles|.dotfiles_local)/i3/i3/*.conf(Noe\''REPLY=${REPLY:t}'\'))

if [ ! -z $DEBUG ]; then
    echo $SOURCES | tr ' ' '\n'
fi

# Concatenate all i3 files from global and local dotfiles into master config.
mkdir -p ~/.config/i3/
cat $SOURCES > ~/.config/i3/config
