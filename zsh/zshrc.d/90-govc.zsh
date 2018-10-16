#######################################################################
#               GOVC (CLI for vSphere) Autocompletions                #
#######################################################################

# Autocompletion for govc
if (( $+commands[govc] )) ; then
   autoload -U +X bashcompinit && bashcompinit
   source $GOPATH/src/github.com/vmware/govmomi/scripts/govc-env.bash
   source $GOPATH/src/github.com/vmware/govmomi/scripts/govc_bash_completion
fi
