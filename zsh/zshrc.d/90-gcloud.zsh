#######################################################################
#                  Google Cloud SDK and Completions                   #
#######################################################################

# Add gcloud to path and completions
if [[ -d ~/google-cloud-sdk ]]; then
    source ~/google-cloud-sdk/path.zsh.inc
    source ~/google-cloud-sdk/completion.zsh.inc
fi

if [[ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]]; then

    source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
    source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

if (($+commands[gcloud])); then
    alias gc=gcloud
fi
