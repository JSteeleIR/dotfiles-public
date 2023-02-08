#######################################################################
#                      Clipboard Helper Aliases                       #
#######################################################################

# Most of these were written to be piped to.

#Quick Clipboard from terminal
#alias xc='xclip -selection c'
alias xc=yank

# Quick copy the last command, and add '$' to the begining
alias xcc='fc -nl -1 | cat <(echo -n "\$") - | xc'

# Tee the current command to the console, and the clipboard
alias txc='tee >(xc)'

# Tee the command line, stripped of the '|txcc' and the output of the command, to the clipboard
alias txcc='cat <(echo "\$> $history[$HISTCMD]\n" | sed -r "s/\s*\|\s*txcc//") - |txc'

# Tee the command line (with PWD), stripped of the '|txcc' and the output of the command, to the clipboard
alias dtxcc='cat <(echo "$PWD \$> $history[$HISTCMD]\n" | sed -r "s/\s*\|\s*txcc//") - |txc'

# Tee the command line, stripped of the '|txccb' and the output to the clipboard.
# Also add HTML bold tags to the command itself.
alias txccb='cat <(echo "<b>\$> $history[$HISTCMD]</b>\n" | sed -r "s/\s*\|\s*txccb//") - |txc'

# Tee the command line, stripped of the '|txccm' and the output to the clipboard.
# Also add markdown bold tags to the command itself.
alias txccm='cat <(echo "**\$> $history[$HISTCMD]**\n" | sed -r "s/\s*\|\s*txccm//") - |txc'
