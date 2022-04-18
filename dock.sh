#!/bin/bash

if [ ! `which dockutil` ]; then
  brew install dockutil
fi

dockutil --no-restart --remove all

dockutil --no-restart --add '/System/Applications/Launchpad.app'
dockutil --no-restart --add '/System/Applications/Mail.app'
dockutil --no-restart --add '/System/Applications/Calendar.app'

dockutil --no-restart --add '/Applications/Spotify.app'

dockutil --no-restart --add '/Applications/Firefox.app'
dockutil --no-restart --add '/Applications/Brave Browser.app'
# dockutil --no-restart --add '/Applications/Google Chrome.app'
# dockutil --no-restart --add '/Applications/Microsoft Edge.app'

dockutil --no-restart --add '/Applications/iTerm.app'

dockutil --no-restart --add '/Applications/Visual Studio Code.app'

dockutil --no-restart --add '~/Developer'
dockutil --no-restart --add '~/Downloads'

killall Dock
