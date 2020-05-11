# Set the prompt elements
#POWERLEVEL9K_CUSTOM_DATE="echo $(date +%Y-%m-%d\ %T%Z)"
#POWERLEVEL9K_CUSTOM_DATE_BACKGROUND="black"
#POWERLEVEL9K_CUSTOM_DATE_FOREGROUND="white"
POWERLEVEL9K_TIME_FORMAT='%D{%Y-%m-%d\ %T%Z}'
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="white"

POWERLEVEL9K_VIRTUALENV_BACKGROUND='013'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='015'

# If gcloud has been used in the last 5 commands, pull the current active configuration information.
zsh_p9k_gcloud(){
    if [[ $(fc -nl -5) =~ 'gcloud|gc' ]]; then
        if (( $+commands[gcloud] )); then
            #local config_name=$(gcloud config configurations list | awk '{if ($2 == "True") print $1;}')
            #local project_id=$(gcloud config configurations list | awk '{if ($2 == "True") print $4;}')
            #echo -n "\u2601 $config_name:$project_id"
            cat $HOME/.config/gcloud/active_config
        fi
    fi
}
POWERLEVEL9K_CUSTOM_GCLOUD="zsh_p9k_gcloud"
POWERLEVEL9K_CUSTOM_GCLOUD_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_GCLOUD_BACKGROUND="018"

# Disable kubecontext for now
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline custom_date kubecontext time virtualenv)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline custom_date time custom_gcloud virtualenv)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline custom_date time virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status history command_execution_time background_jobs load)

# Two-lined prompt
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# Date on Newline
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{white} `date +%Y-%m-%d\ %T%Z` %f%k%F{093}\uE0B0%f "

# Settings for recording asciicasts:
if [[ -v ASCIINEMA_REC ]]; then
    POWERLEVEL9K_DISABLE_RPROMPT=true
    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'>'
fi
