# Set the prompt elements
#POWERLEVEL9K_CUSTOM_DATE="echo $(date +%Y-%m-%d\ %T%Z)"
#POWERLEVEL9K_CUSTOM_DATE_BACKGROUND="black"
#POWERLEVEL9K_CUSTOM_DATE_FOREGROUND="white"
POWERLEVEL9K_TIME_FORMAT='%D{%Y-%m-%d\ %T%Z}'
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="white"

# Disable kubecontext for now
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline custom_date kubecontext time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline custom_date time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status history command_execution_time background_jobs load)

# Two-lined prompt
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# Date on Newline
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{white} `date +%Y-%m-%d\ %T%Z` %f%k%F{093}\uE0B0%f "

#POWERLEVEL9K_DISABLE_RPROMPT=true
