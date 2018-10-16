#######################################################################
#                          GPG and SSH Agent                          #
#######################################################################

# Make sure we have GPG agent (for yubikey smartcard SSH auth), and keep
# SSH_AUTH_SOCK sane across forwarded SSH sessions, TMUX, etc.
#
# Loaded BEFORE tmux and on every shell creation, so that the SSH agent
# is set to a reliable place and we don't end up trying to manage the
# variable in each pane/shell. Also finds forwarded SSH Agents.

# Enable gpg-agent if it is not running
GPG_AGENT_SOCKET="${HOME}/.gnupg/S.gpg-agent.ssh"
if [ ! -S $GPG_AGENT_SOCKET ]; then
  gpg-agent --daemon >/dev/null 2>&1
  #export GPG_TTY=$(tty)
fi

# Leverage ssh-find-agent to keep the SSH socket consistent.
source $HOME/.dotfiles/scripts/ssh-find-agent.sh

# Only search for SSH-Agent at shell load when we're not in TMUX already.
if [ -z $TMUX ]; then
    echo "Searching for SSH-Agent..."
    ssh-find-agent -a
fi
