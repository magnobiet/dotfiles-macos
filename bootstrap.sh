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
  # ssh-keygen -t rsa -b 4096 -C "magno.biet@gmail.com"
  ssh-keygen -o -a 100 -t ed25519 -C "magno.biet@gmail.com"
fi

eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519

cat $HOME/.ssh/id_ed25519.pub

# Homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'export PATH="/usr/local/sbin:$PATH"' >> $HOME/.zshrc
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

# ASDF
sh $DOTFILES_PATH/asdf.sh

# Install Dracula Theme
sh $DOTFILES_PATH/dracula.sh

# Install apps
sh $DOTFILES_PATH/apps.sh --work --office --vm --sync --db
sh $DOTFILES_PATH/node.sh
sh $DOTFILES_PATH/mobile.sh

# Cleanup Homebrew
brew cleanup

# Dotfiles
sh $DOTFILES_PATH/dotfiles.sh

# Reset Dock
sh $DOTFILES_PATH/dock.sh

# Open apps that need to be configured
sh $DOTFILES_PATH/open.sh

# Reset Launchpad
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

neofetch

echo ""
echo "✅ Done. Note that some of these changes require a logout/restart to take effect.\n"
