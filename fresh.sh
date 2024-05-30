#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Removes .p10k.zsh from $HOME (if it exists) and symlinks the .p10k.zsh file from the .dotfiles
rm -rf $HOME/.p10k.zsh
ln -sw $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a Sites directory
mkdir $HOME/Sites

# Create sites subdirectories
mkdir $HOME/Sites/php

# Clone Github repositories
./clone.sh

# Symlink the Mackup config file to the home directory
ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

# Removes karabiner.json from $HOME/.config/karabiner (if it exists) and symlinks the karabiner.json file from the .dotfiles
rm -rf $HOME/.config/karabiner/karabiner.json
mkdir -p $HOME/.config/karabiner
ln -s karabiner.json $HOME/.config/karabiner/karabiner.json

# Removes .ideavimrc from $HOME/.ideavimrc (if it exists) and symlinks the .ideavimrc file from the .dotfiles
rm -rf $HOME/.ideavimrc
ln -s .ideavimrc $HOME/.ideavimrc

# Set iterm config files.
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvchad $HOME/.config/nvim

# Alacritty
rm -rf $HOME/.config/alacritty
ln -s $DOTFILES/alacritty $HOME/.config/alacritty

# Tmux
rm -rf $HOME/.tmux
rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/tmux/.tmux $HOME/.tmux
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

# Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

# Phpactor
rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

# Scripts
ln -sf $DOTFILES/scripts/t $HOME/.local/bin/t

# NVM (Node Version Manager)
mkdir -p $HOME/.nvm
ln -sf $DOTFILES/nvm/default-packages $HOME/.nvm/default-packages

# Bat
rm -rf $HOME/.config/bat
ln -s $DOTFILES/bat $HOME/.config/bat
