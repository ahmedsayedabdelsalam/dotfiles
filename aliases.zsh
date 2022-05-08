# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Sites"

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias t="php artisan tinker"
alias seed="php artisan db:seed"

# Laravel Sail
alias sail="[ -f sail ] && bash sail || bash vendor/bin/sail"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# Git

# Magento
alias m="bin/magento"
