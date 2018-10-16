#######################################################################
#                     Python Environment Settings                     #
#######################################################################

# Add python user_base path if it exists
if [[ -d ~/.local/bin ]]; then
    export PATH=$PATH:$HOME/.local/bin/
fi
