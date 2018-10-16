#######################################################################
#                            OSX Settings                             #
#######################################################################

# If OSX, add custom homebrew path and fix vim to be mvim
if [[ `uname` == 'Darwin' ]]; then
    if [[ -d $HOME/.homebrew ]]; then
        export PATH="$PATH:$HOME/.homebrew/bin"
        #Turn off Homebrew analytics
        export HOMEBREW_NO_ANALYTICS=1
    fi

    if [[ -d  /Applications/MacVim.app/ ]]; then
        alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
    fi

fi
