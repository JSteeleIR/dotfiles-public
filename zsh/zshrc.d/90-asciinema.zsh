#######################################################################
#                          90-asciinema.zsh                           #
#######################################################################

if (( $+commands[asciinema] )); then
    _AC_TMUX_COMMAND="TMUX='' tmux new-session -t asciinema \; \
        setw force-width 120 \; setw force-height 40 \; attach"
    _AC_TMUX_RESIZE="tmux resize-pane -x 120 -y 40"
    alias ac=asciinema
    alias acr='asciinema rec'
    alias acrt="$_AC_TMUX_RESIZE && asciinema rec -i 20 -c \"$_AC_TMUX_COMMAND\""
    alias acp='asciinema play'
fi

#######################################################################
#                       END OF 90-asciinema.zsh                       #
#######################################################################

