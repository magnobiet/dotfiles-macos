#!/bin/bash

withWorkApps=false
withGames=false
withRPI=false
withOffice=false
withBitcoin=false
withSport=false
withVirtualBox=false
withHeroku=false
withSync=false

while test $# -gt 0; do

  case "$1" in
    --work) withWorkApps=true ;;
    --games) withGames=true ;;
    --rpi) withRPI=true ;;
    --office) withOffice=true ;;
    --btc) withBitcoin=true ;;
    --sport) withSport=true ;;
    --vm) withVirtualBox=true ;;
    --heroku) withHeroku=true ;;
    --sync) withSync=true ;;
  esac

  shift

done

# Fonts
if [ ! `which svn` ]; then
  brew install svn
fi

brew tap homebrew/cask-fonts

brew install --cask font-jetbrains-mono

brew install --cask font-hack-nerd-font

brew install --cask font-arial
brew install --cask font-arial-black

brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font

brew install --cask font-fira-mono
brew install --cask font-fira-mono-nerd-font
brew install --cask font-fira-mono-for-powerline

brew install --cask font-fira-sans
brew install --cask font-fira-sans-condensed
brew install --cask font-fira-sans-extra-condensed

brew install --cask font-fontawesome
brew install --cask font-material-icons

# Security
brew install --cask 1password
brew install --cask authy
brew install --cask gpg-suite

# Screensaver
brew install --cask aerial

# Comunication
brew install --cask slack
brew install --cask zoom
brew install --cask discord
brew install --cask telegram
brew install --cask whatsapp

if [ "$withWorkApps" = true ] ; then

  brew install --cask rocket-chat
  brew install --cask microsoft-teams

fi

# Browsers
brew install --cask firefox
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask microsoft-edge

# Development
brew install git
brew install git-flow-avh
brew install --cask github

## Databases and APIs
brew install --cask postman
brew install --cask ngrok

if [ "$withWorkApps" = true ] ; then
  brew install --cask dbeaver-community
fi

## Runtime and SDKs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

if ! grep -q "export NVM_DIR" "$HOME/.zshrc"; then

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

fi

nvm install --lts
nvm use --lts

brew install ruby

brew install python@3.9
brew install pipenv

brew install --cask oracle-jdk

brew tap dart-lang/dart
brew install dart

## Mobile
brew install --cask android-platform-tools
brew install --cask cocoapods

## IDE/Editors
brew install --cask visual-studio-code
brew install --cask android-studio
brew install --cask sublime-text
brew install --cask jetbrains-toolbox

## PaaS
if [ "$withHeroku" = true ] ; then

  brew tap heroku/brew
  brew install heroku

fi

# Containers and virtual machines
brew install --cask docker
brew install docker-compose

brew install --cask switchhosts

if [ "$withVirtualBox" = true ] ; then

  brew install --cask virtualbox
  brew install --cask virtualbox-extension-pack

  brew install --cask vagrant
  brew install vagrant-completion
  brew install --cask vagrant-manager

fi

## i18n
brew install --cask poedit

# Design and images
brew install --cask figma
brew install exiftool

# Productivity
brew install --cask rescuetime

if [ "$withWorkApps" = true ] ; then
  brew install --cask toggl-track
fi

# Streaming and media players
brew install --cask spotify
brew install --cask vlc

# Games
if [ "$withGames" = true ] ; then

  brew install --cask steam
  brew install --cask gog-galaxy
  brew install --cask epic-games
  brew install --cask origin

fi

# Cloud files management
if [ "$withSync" = true ] ; then

  brew install --cask dropbox
  brew install --cask onedrive
  brew install --cask megasync
  brew install --cask google-photos-backup-and-sync
  brew install --cask transmission

fi

# Grammar
brew install --cask grammarly
brew install --cask dictionaries

# Activity tracking analysis
if [ "$withSport" = true ] ; then

  brew install --cask goldencheetah
  brew install --cask gpxsee

fi

# Office
if [ "$withOffice" = true ] ; then

  brew uninstall --cask onedrive
  brew install --cask microsoft-office

fi

# Raspberry PI
if [ "$withRPI" = true ] ; then

  brew install --cask raspberry-pi-imager
  brew install --cask balenaetcher

fi

# Bitcoin
if [ "$withBitcoin" = true ] ; then
  brew install --cask exodus
fi

# Others
brew install --cask macdown
brew install --cask gifox
brew install --cask skitch
brew install --cask notion
brew install --cask anki
brew install --cask spectacle
brew install --cask cakebrew
brew install --cask appcleaner
brew install --cask dozer
