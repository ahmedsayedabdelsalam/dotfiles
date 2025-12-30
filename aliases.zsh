# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias m1="arch -x86_64"
alias vim=nvim
alias vi=nvim
alias k=kubectl
alias tm='tmux attach -t default || tmux new -s default'
alias avante='nvim -c "lua vim.defer_fn(function()require(\"avante.api\").zen_mode()end, 100)"'
alias fixmounthdd='sudo pkill -f fsck'
alias fixturnoffspotlight='sudo mdutil -i off'
alias fixturnonspotlight='sudo mdutil -i on'
alias restart-aerospace-swipe="launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.acsandmann.swipe.plist 2>/dev/null && launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.acsandmann.swipe.plist"

# Eza (better ls)
alias ls="eza --icons=always"

# Zoxide (better cd)
alias cd="z"

# Bat (better cat)
alias cat="bat"
alias timestamp="date +%s"
alias timestamp="date +%s"

# Directories
alias dotfiles="cd $DOTFILES"
alias config="cd $HOME/.config"
alias sites="cd $HOME/Sites"
alias work="cd $HOME/Sites/workspace"

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
alias gcz="git cz"
alias glm="submodule update --remote --merge"
alias gpm="git push --recurse-submodules=on-demand"

# Magento
alias m="bin/magento"
