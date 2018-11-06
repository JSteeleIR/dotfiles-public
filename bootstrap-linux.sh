#!/bin/bash
# This script literally meant to bootstrap a linux system to preferred configuration.
# It's dirty. It's apt dependent at the moment.

sudo apt-get update

gpg_setup(){
    # Install gpg-agent/smartcard dependencies:
    sudo apt-get install -y gnupg2 gnupg-agent pinentry-curses scdaemon pcscd

    # Configure gpg and gpg-agent:
    mkdir ~/.gnupg
    cat <<- 'EOF' > ~/.gnupg/gpg.conf
    cert-digest-algo SHA512
    default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
EOF

    chmod 600 ~/.gnupg/gpg.conf

    cat <<- 'EOF' > ~/.gnupg/gpg-agent.conf
    enable-ssh-support
    pinentry-program /usr/bin/pinentry-curses
    default-cache-ttl 60
    max-cache-ttl 120
EOF
    chmod 600 ~/.gnupg/gpg-agent.conf

    # Set GPG things for the first time
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpg-connect-agent updatestartuptty /bye
}

# Install sane things
sudo apt-get install -y vim vim-youcompleteme less tmux git zsh

git clone --recursive https://github.com/JSteeleIR/dotfiles-public.git ~/.dotfiles
~/.dotfiles/install

# Install Vim plugins
vim -c VundleInstall -c quitall
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --go-completer
chsh -s /bin/zsh
