#!/bin/bash

# Set SCREEN_LOCK status in timekeeper.
$HOME/.dotfiles/scripts/timekeep.sh SCREEN_LOCK

# Call i3lock-multimonitor with a random background, or fallback to regular i3lock
$HOME/.dotfiles/i3/i3lock-multimonitor/lock -a '-etn' -i $(find $HOME/Downloads/backgrounds -name '*.png' | shuf -n1) || i3lock -en -c 000000

# Run post-unlock things.
$HOME/.dotfiles/scripts/i3-post-unlock.sh
