#!/bin/bash

withWorkApps=false
withGames=false
withRPI=false
withOffice=false
withSport=false
withSync=false
withDatabase=false
withBank=false

while test $# -gt 0; do

  case "$1" in
    --work) withWorkApps=true ;;
    --games) withGames=true ;;
    --rpi) withRPI=true ;;
    --office) withOffice=true ;;
    --sport) withSport=true ;;
    --sync) withSync=true ;;
    --db) withDatabase=true ;;
    --bank) widhBank=true ;;
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

brew install font-meslo-for-powerline

# https://developer.apple.com/fonts/
# https://aka.ms/WebFluentFonts

# Terminal
brew install vim
brew install --cask iterm2

# Security
brew install --cask 1password
# brew install --cask nordpass
brew install --cask bitwarden
# brew install --cask keepassxc

# Screensaver
brew install --cask aerial

# Comunication
brew install --cask discord
brew install --cask zoom
brew install --cask slack
brew install --cask telegram
brew install --cask whatsapp
brew install meetingbar

if [ "$withWorkApps" = true ] ; then

  brew install --cask microsoft-teams

fi

# Browsers
brew install --cask firefox
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask microsoft-edge

# Development
brew install git
brew install --cask github

## Databases and APIs
brew install --cask postman

if [ "$withDatabase" = true ] ; then
  brew install --cask dbeaver-community
fi

## Runtime and SDKs
brew install --cask oracle-jdk

## Mobile
brew install --cask android-platform-tools
sudo gem install cocoapods

## IDE/Editors
brew install --cask visual-studio-code
# brew install --cask android-studio
# brew install --cask jetbrains-toolbox

# Containers and virtual machines
brew install docker docker-compose docker-credential-helper colima
brew install ctop

brew install --cask switchhosts

## i18n
brew install --cask poedit

# Design and images
brew install --cask figma
brew install exiftool

# Productivity
if [ "$withWorkApps" = true ] ; then
  brew install --cask toggl-track
fi

# Streaming and media players
brew install --cask spotify
brew install --cask vlc

# Games
if [ "$withGames" = true ] ; then

  brew install --cask steam
  # brew install --cask gog-galaxy
  # brew install --cask epic-games
  # brew install --cask origin

fi

# Cloud files management
if [ "$withSync" = true ] ; then

  brew install --cask dropbox
  brew install --cask onedrive
  brew install --cask megasync
  brew install --cask google-drive
  brew install --cask transmission

fi

# Write
brew install --cask macdown
# brew install --cask typora

# Grammar
brew install --cask grammarly-desktop
# brew install --cask dictionaries

# Activity tracking analysis
if [ "$withSport" = true ] ; then

  brew install --cask goldencheetah
  brew install --cask gpxsee

fi

# Office
if [ "$withOffice" = true ] ; then

  brew uninstall --cask onedrive
  brew install --cask microsoft-office

  # brew install --cask onlyoffice

fi

# Raspberry PI
if [ "$withRPI" = true ] ; then

  brew install --cask raspberry-pi-imager
  brew install --cask balenaetcher

fi

# Bank
if [ "$withBank" = true ] ; then
  brew install --cask itau
fi

# Others
brew install --cask notion
brew install --cask anki
brew install --cask tiles
brew install --cask hiddenbar
brew install --cask itsycal
brew install --cask appcleaner
brew install --cask android-file-transfer
brew install --cask latest
brew install --cask the-unarchiver
brew install --cask keycastr
brew install folderify
