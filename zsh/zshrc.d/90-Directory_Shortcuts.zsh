# Set some shortcuts for common paths
function hash_dirs() {
    echo "Updating directory hash table..."
    hash -d df="$HOME/.dotfiles"
    hash -d dfl="$HOME/.dotfiles_local"

    # Meta-named dirs (depend on prior nameddirs)
    hash -d dfz="$nameddirs[df]/zsh/zshrc.d/"
    hash -d dflz="$nameddirs[dfl]/zsh/zshrc.d/"
}

hash_dirs
setopt cdablevars
