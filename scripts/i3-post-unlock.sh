#!/usr/bin/zsh
# This script contains actions that should be run after every i3lock exit.
# e.g. Reconnecting the SSH-Agent socket (to compensate for having ssh'ed in
# while remote.)

# Leverage ssh-find-agent to keep the SSH socket consistent.
source $HOME/.dotfiles/scripts/ssh-find-agent.sh
ssh-find-agent -a
