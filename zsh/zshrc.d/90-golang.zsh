#######################################################################
#                          Golang PATH                                #
#######################################################################

## Add GOPATH, if go is installed and in ~
if [[ -d $HOME/go && -n $+commands[go] ]]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi
