################################################################################
#                   Directory-Specific "Profiles"/Functions                    #
################################################################################
# Sometimes, you really want the shell to behave a different way depending on
# the directory you're in. Specifically, run certain functions, export
# variables, etc, based on the current path. chpwd_profiles lets us do that.
#
# This is taken from https://superuser.com/a/528760

function chpwd_profiles() {
    local profile context
    local -i reexecute

    context=":chpwd:profiles:$PWD"
    zstyle -s "$context" profile profile || profile='default'
    zstyle -T "$context" re-execute && reexecute=1 || reexecute=0

    if (( ${+parameters[CHPWD_PROFILE]} == 0 )); then
        typeset -g CHPWD_PROFILE
        local CHPWD_PROFILES_INIT=1
        (( ${+functions[chpwd_profiles_init]} )) && chpwd_profiles_init
    elif [[ $profile != $CHPWD_PROFILE ]]; then
        (( ${+functions[chpwd_leave_profile_$CHPWD_PROFILE]} )) \
            && chpwd_leave_profile_${CHPWD_PROFILE}
    fi
    if (( reexecute )) || [[ $profile != $CHPWD_PROFILE ]]; then
        (( ${+functions[chpwd_profile_$profile]} )) && chpwd_profile_${profile}
    fi

    CHPWD_PROFILE="${profile}"
    return 0
}
# Add the chpwd_profiles() function to the list called by chpwd()!
chpwd_functions=( ${chpwd_functions} chpwd_profiles )


# Now, profiles can be definted as such:
#chpwd_profile_NAME() {
#    [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
#    print "chpwd(): Switching to profile: $profile"
#
#    export VAR=value
#}
#zstyle ':chpwd:profiles:/path/to/directory(|/|/*)' profile NAME
