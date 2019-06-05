#!/usr/bin/zsh
# This script contains actions that should be run after every i3lock exit.
# e.g. Reconnecting the SSH-Agent socket (to compensate for having ssh'ed in
# while remote.)

# Leverage ssh-find-agent to keep the SSH socket consistent.
source $HOME/.dotfiles/scripts/ssh-find-agent.sh
ssh-find-agent -a

# Re-set the global TMUX display var on unlock.
TMUXPID=$(ps aux | grep 'tmux' | grep -v grep | awk '{print $2}')
if [ $TMUXPID ]; then
    echo "Setting TMUX DISPLAY variable..."
    tmux set-environment -g DISPLAY $DISPLAY
fi

touch /tmp/post-unlock
$HOME/.dotfiles/scripts/timekeep.sh SCREEN_UNLOCK
