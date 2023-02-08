#######################################################################
#                                TMUX                                 #
#######################################################################

# Launch TMUX on every shell (if not already in one), for all of the goodies
# that it provides. Add the scripts dir to the PATH before launch, so tmux can make
# use of custom scripts during it's runtime (not subject to the shell PATH)


export PATH="$PATH:$HOME/.dotfiles/scripts"


# Check for and start TMUX. Don't start if NO_INIT_TMUX is set.
if [[ -z "$TMUX" ]]; then
    if [[ ! -v $SUPPRESS_TMUX ]]; then
        echo "Launching tmux..."
        tmux new-session -A -s tmux_base
    else
        echo "SUPPRESS_TMUX is set. Supressing TMUX launch."
    fi
fi
