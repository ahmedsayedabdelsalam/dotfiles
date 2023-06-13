#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Oh My Zsh and add some plugins
if test $(which omz); then
  /bin/sh -c "$(git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s .zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install imagick redis

# Install global Composer packages
composer global require laravel/installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
mkdir $HOME/Sites

# Create sites subdirectories
mkdir $HOME/Sites/php

# Clone Github repositories
./clone.sh

# Symlink the Mackup config file to the home directory
ln -s .mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

# Removes karabiner.json from $HOME/.config/karabiner (if it exists) and symlinks the karabiner.json file from the .dotfiles
rm -rf $HOME/.config/karabiner/karabiner.json
mkdir -p $HOME/.config/karabiner
ln -s karabiner.json $HOME/.config/karabiner/karabiner.json

# Removes .ideavimrc from $HOME/.ideavimrc (if it exists) and symlinks the .ideavimrc file from the .dotfiles
rm -rf $HOME/.ideavimrc
ln -s .ideavimrc $HOME/.ideavimrc
