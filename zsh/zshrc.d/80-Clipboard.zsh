#######################################################################
#                      Clipboard Helper Aliases                       #
#######################################################################

# Most of these were written to be piped to.

#Quick Clipboard from terminal
alias xc='xclip -selection c'
# Quick copy the last command, and add '$' to the begining
alias xcc='fc -nl -1 | cat <(echo -n "\$") - | xc'
# Tee the current command to the console, and the clipboard
alias txc='tee >(xc)'
# Tee the command line, stripped of the '|txcc' and the output of the command, to the clipboard
alias txcc='cat <(echo "<b>\$ $history[$HISTCMD]</b>\n" | sed -r "s/\s*\|\s*txcc//") - |txc'

