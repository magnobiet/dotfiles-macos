#!/bin/bash

set -e

sudo -v

DOTFILES_PATH="$HOME/.dotfiles"

echo "🚀 Welcome to the magnobiet/dotfiles-macos installer!"
echo ""

# Install command line tools
softwareupdate -i -a

if [ ! `which xcode-select` ]; then
  xcode-select --install
fi

# Create Developer folder
mkdir -p $HOME/Developer/{SDK,GitHub}

# Generate SSH key
if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
  ssh-keygen -o -a 100 -t ed25519 -C "magno.biet@gmail.com"
fi

eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519

cat $HOME/.ssh/id_ed25519.pub

# Homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Git
if [ ! `which git` ]; then
  brew install git
fi

# Download dotfiles script
if [ ! -d $DOTFILES_PATH ]; then
  git clone https://github.com/magnobiet/dotfiles-macos.git $DOTFILES_PATH
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

# macOS default configs
sh $DOTFILES_PATH/defaults.sh

# Reset Dock
sh $DOTFILES_PATH/dock.sh

# Install Dracula Theme
sh $DOTFILES_PATH/dracula.sh

# Install apps
sh $DOTFILES_PATH/apps.sh --games --rpi --office --btc --sport --vm --heroku --sync --db --bank
sh $DOTFILES_PATH/node.sh
sh $DOTFILES_PATH/mobile.sh

# ZSH
sh $DOTFILES_PATH/zsh.sh

# Cleanup Homebrew
brew cleanup

# Dotfiles
sh $DOTFILES_PATH/dotfiles.sh

# Open applications
open /Applications/Spectacle.app
open /Applications/Dozer.app

open /Applications/Spotify.app

open /Applications/Authy\ Desktop.app
open /Applications/1Password\ 7.app

open /Applications/Dropbox.app
open /Applications/Backup\ and\ Sync.app
open /Applications/MEGAsync.app
open /Applications/OneDrive.app

open /System/Applications/App\ Store.app

open /Applications/Firefox.app

# Reset Launchpad
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

echo ""
echo "✅ Done. Note that some of these changes require a logout/restart to take effect.\n"
