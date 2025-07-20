#!/bin/bash

set -e

sudo -v

DOTFILES_PATH="$HOME/.dotfiles"

echo "🚀 Welcome to the magnobiet/dotfiles-macos installer!"
echo ""

# Install command line tools
softwareupdate -i -a

# Check if xcode-select is installed
if ! command -v xcode-select >/dev/null 2>&1; then
  xcode-select --install
fi

# Create Developer folder
mkdir -p "$HOME/Developer/{Courses,GitHub}"

# Generate SSH key if not present
if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
  # ssh-keygen -t rsa -b 4096 -C "magno.biet@gmail.com"
  ssh-keygen -o -a 100 -t ed25519 -C "magno.biet@gmail.com"
fi

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"

cat "$HOME/.ssh/id_ed25519.pub"

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'export PATH="/usr/local/sbin:$PATH"' >> "$HOME/.zshrc"
fi

# Git
if ! command -v git >/dev/null 2>&1; then
  brew install git
fi

# SVN
if ! command -v svn >/dev/null 2>&1; then
  brew install svn
fi

# Download dotfiles script
if [ ! -d "$DOTFILES_PATH" ]; then
  git clone https://github.com/magnobiet/dotfiles-macos.git "$DOTFILES_PATH"
else
  cd "$DOTFILES_PATH" && git pull
fi

brew doctor
brew update
brew upgrade

# Install utils
brew install wget
brew install tree
brew install htop
brew tap gantoreno/macfetch && brew install macfetch

# macOS default configs
bash "$DOTFILES_PATH/defaults.sh"

# ASDF
bash "$DOTFILES_PATH/asdf.sh"

# Install Dracula Theme
bash "$DOTFILES_PATH/dracula.sh"

# Install apps
bash "$DOTFILES_PATH/apps.sh" --work --office --vm --sync --db
bash "$DOTFILES_PATH/mobile.sh"

# Cleanup Homebrew
brew cleanup

# Dotfiles
bash "$DOTFILES_PATH/dotfiles.sh"

# Reset Dock
bash "$DOTFILES_PATH/dock.sh"

# Open apps that need to be configured
bash "$DOTFILES_PATH/open.sh"

# Reset Launchpad
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

# Only run macfetch if installed
if command -v macfetch >/dev/null 2>&1; then
  macfetch
fi

echo ""
echo "✅ Done. Note that some of these changes require a logout/restart to
