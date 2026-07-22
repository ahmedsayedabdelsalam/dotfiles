# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles
# Path to you Sites
export SITES=$HOME/Sites

export TERM="tmux-256color"

autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source $DOTFILES/path.zsh
source $DOTFILES/aliases.zsh

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    tmux
)

# auto start tmux
# ZSH_TMUX_AUTOSTART=true

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Mise (Node | Ruby version manager)
eval "$(mise activate zsh)"

# Android
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# ZSH plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Atuin (magical shell history)
eval "$(atuin init zsh)"

# FZF
source ~/fzf/fzf.sh

# Carapace (command argument completion)
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# ---- TheFuck -----
# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Yazi
source ~/.config/yazi/yazi.zsh

# Television
eval "$(tv init zsh)"

# Sesh
fpath=(~/.zsh/completions $fpath)

# Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# export JAVA_TOOL_OPTIONS="-Xmx2G -Xms512M"

export EDITOR=nvim

# Support Vi keybindings in Zsh
set -o vi

# LazyGit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/themes/catppuccin/themes-mergable/mocha/peach.yml"

export GITHUB_USER=ahmedsayedabdelsalam
export GITHUB_PAT=$(security find-generic-password -s "github_pat" -w)
export MASTER_GITHUB_USER="$GITHUB_USER"
export MASTER_GITHUB_PAT="$GITHUB_PAT"
export NODE_AUTH_TOKEN=$(security find-generic-password -s "github_packages_pat" -w)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# Zoxide (better cd)
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
