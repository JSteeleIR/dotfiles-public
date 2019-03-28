#######################################################################
#                      80-expandable-aliases.zsh                      #
#######################################################################

# Automatically-expanding aliases, as found here:
# http://www.math.cmu.edu/~gautam/sj/blog/20140625-zsh-expand-alias.html

typeset -a ealiases
ealiases=()

function ealias()
{
        alias $1
            ealiases+=(${1%%\=*})

}

function expand-ealias()
{
        if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$"  ]]; then
                    zle _expand_alias
                            zle expand-word
                                fi
                                    zle magic-space

}

zle -N expand-ealias

bindkey -M viins ' '        expand-ealias
bindkey -M viins '^ '       magic-space     # control-space to bypass completion
bindkey -M isearch " "      magic-space     # normal space during searches

#######################################################################
#                  END OF 80-expandable-aliases.zsh                   #
#######################################################################


