#######################################################################
#                                TMUX                                 #
#######################################################################

# Launch TMUX on every shell (if not already in one), for all of the goodies
# that it provides. Add the scripts dir to the PATH before launch, so tmux can make
# use of custom scripts during it's runtime (not subject to the shell PATH)


export PATH="$PATH:$HOME/.dotfiles/scripts"


# Check for and start TMUX
if [[ -z "$TMUX" ]]; then
       echo "Launching tmux..."
       tmux attach-session -t tmux_base || tmux new-session -s tmux_base
fi
