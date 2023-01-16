# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias m1="arch -x86_64"

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Sites"

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias t="php artisan tinker"
alias seed="php artisan db:seed"

# Laravel Sail
function sail() {
    if [ -f sail ]; then
        sh sail "$@"
    elif [ -f bin/sail ]; then
        sh bin/sail "$@"
    else
        sh vendor/bin/sail $@
    fi
}
alias sail=sail

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# Git
alias gbc="$DOTFILES/git-clean.sh"

# Magento
alias m="bin/magento"
