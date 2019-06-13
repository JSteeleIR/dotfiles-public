#######################################################################
#                  SSH Agent and TMUX Helper Aliases                  #
#######################################################################

# Sometimes, tmux will get garbled and detach from the pty, or the
# SSH_AUTH_SOCK will get lost, etc. These help with that.

# Add quick shortcut to reattach or create base tmux session
alias tmxa='tmx2 attach-session -t tmux_base || tmx2 new-session -s tmux_base'

# Add alias to re-export DISPLAY variable
#alias rexd='TMUXDISPLAY="$(tmux show-env -g DISPLAY | sed -n s/^DISPLAY=//p)" echo "Setting DISPLAY=$TMUXDISPLAY" && export DISPLAY=$TMUXDISPLAY'
alias rexd0='echo "Setting DISPLAY=:0" && export DISPLAY=:0'

rexd() {
    TMUXDISPLAY="$(tmux show-env -g DISPLAY | sed -n 's/^.*=//p')"
    echo "Setting DISPLAY=$TMUXDISPLAY"
    export DISPLAY=$TMUXDISPLAY
}

# Manually search for the SSH_AUTH_AGENT, and let us choose
alias sfa='ssh-find-agent -c'

# Show keys available in the current SSH_AUTH_SOCK
alias sal='ssh-add -l'
alias saL='ssh-add -L'

# gpg-agent based ssh-agent reload. sets TTY so Pinentry knows where to ask
# for pin (if using a yubikey for SSH key storage)
alias gpr='gpg-connect-agent updatestartuptty /bye'
alias pkp='pkill pinentry'
