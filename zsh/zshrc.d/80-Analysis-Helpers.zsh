#######################################################################
#                       Analysis Helper Aliases                       #
#######################################################################

alias g='googler --noua'
alias defangdomain='sed -e "s|\.|[\.]|g"'
alias defangurl='sed -re "s|http(s?\:\/\/[[:alnum:]\.]*)\.([[:alnum:]]*\/?)|hxxp\1[.]\2|g"'

# Tshark Analysis Shortcuts
alias tsum='tshark_summary.sh'

# shorthand for xdg-open to open files in the right program based on
# their MIME type
alias start='xdg-open'
