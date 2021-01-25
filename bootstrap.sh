#!/bin/bash

set -e

DOTFILES_PATH="$HOME/.dotfiles"

# Install command line tools
# xcode-select --install

# Create Developer folder
mkdir -p $HOME/Developer/{SDK,GitHub}

# Generate SSH keys
if ! test -f "$HOME/.ssh/id_rsa.pub"; then
  ssh-keygen -t rsa -b 4096
fi

cat $HOME/.ssh/id_rsa.pub

# Homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Git
if [ ! `which git` ]; then
  brew install git
fi

# dotfiles
if [ ! -d $DOTFILES_PATH ]; then
  git clone git@github.com:magnobiet/dotfiles-macos.git $DOTFILES_PATH
else
  cd $DOTFILES_PATH && git pull
fi

brew doctor
brew update
brew upgrade

# Install utils
brew install wget
brew install tree
brew install htop
brew install neofetch

# Install Dracula Theme
sh $DOTFILES_PATH/dracula.sh

# Install apps
sh $DOTFILES_PATH/apps.sh --work --office --sync

# ZSH
sh $DOTFILES_PATH/zsh.sh

# Cleanup Homebrew
brew cleanup

# Dotfiles
sh $DOTFILES_PATH/dotfiles.sh

# Reset Launchpad
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
