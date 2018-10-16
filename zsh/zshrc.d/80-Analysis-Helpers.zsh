#######################################################################
#                       Analysis Helper Aliases                       #
#######################################################################

alias g='googler'
alias defangdomain='sed -e "s|\.|[\.]|g"'
alias defangurl='sed -re "s|http(s?\:\/\/[[:alnum:]\.]*)\.([[:alnum:]]*\/?)|hxxp\1[.]\2|g"'

# Tshark Analysis Shortcuts
alias tsum='tshark_summary.sh'
