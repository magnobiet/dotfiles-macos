#!/bin/bash

# restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# MENU BAR #####################################################################
# show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES

# FINDER #######################################################################
# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# show the ~/Library folder
chflags nohidden ~/Library

# show the /Volumes folder
chflags nohidden /Volumes

# save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# SCREEN #######################################################################
# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# save screenshots to the ~/Screen Shots
mkdir -p "${HOME}/Screen Shots"
defaults write com.apple.screencapture location -string "${HOME}/Screen Shots"

# save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# DOCK #########################################################################
# minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Hot corners
# top right → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# top right → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0

# bottom right → Start Screen Saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# bottom left → Launchpad
defaults write com.apple.dock wvous-bl-corner -int 11
defaults write com.apple.dock wvous-bl-modifier -int 0

# SAFARI #######################################################################
# privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# set Safari’s home page to `about:blank`
defaults write com.apple.Safari HomePage -string "about:blank"

# enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# enable "Do Not Track"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# APP STORE ####################################################################
# enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true
