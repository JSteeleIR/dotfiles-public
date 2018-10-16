#######################################################################
#                      Ubuntu Specific Settings                       #
#######################################################################

if [[ `uname` == Linux && `cat /etc/lsb-release` =~ "Ubuntu|Debian" ]]; then

    # Un-Fuck Ubuntu zsh-vim-mode keyboard mappings for up arrow.
    # Because sometimes, we still want emacs movement (Heathens).
    if [[ "$TERM" != emacs ]] && (( ${+terminfo} )) 2>/dev/null; then
    (( ${+terminfo[cuu1]}  )) && bindkey -M viins "$terminfo[cuu1]" up-line-or-history
    (( ${+terminfo[kcuu1]} )) && bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
    (( ${+terminfo[kcud1]} )) && bindkey -M viins "$terminfo[kcud1]" down-line-or-history
    [[ "${terminfo[kcuu1]:-}" == "O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
    [[ "${terminfo[kcud1]:-}" == "O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history
    fi
fi
