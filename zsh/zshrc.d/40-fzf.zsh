#######################################################################
#                             40-fzf.zsh                              #
#######################################################################

if [[ `uname` == 'Darwin' ]]; then
     [ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
fi

if [[ `uname` == 'Linux' ]]; then
    if [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
        source /usr/share/doc/fzf/examples/completion.zsh
        source /usr/share/doc/fzf/examples/key-bindings.zsh
    fi

    if [[ -x /usr/local/opt/fzf/bin/fzf ]]; then

        # Setup fzf
        # ---------
        if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
          PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
        fi

        # Auto-completion
        # ---------------
        [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

        # Key bindings
        # ------------
        source "/usr/local/opt/fzf/shell/key-bindings.zsh"
    fi
fi

#######################################################################
#                          END of 40-fzf-zsh                          #
#######################################################################

