#######################################################################
#                                TMUX                                 #
#######################################################################

# Launch TMUX on every shell (if not already in one), for all of the goodies
# that it provides. Add the scripts dir to the PATH before launch, so tmux can make
# use of custom scripts during it's runtime (not subject to the shell PATH)


export PATH="$PATH:$HOME/.dotfiles/scripts"


# Check for and start TMUX. Don't start if in ASCIINEMA session.
if [[ -z "$TMUX" && ! -v ASCIINEMA_REC ]]; then
       echo "Launching tmux..."
       tmux new-session -A -s tmux_base
fi
