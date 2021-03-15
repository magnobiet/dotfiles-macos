#!/bin/bash

if [ ! `which dockutil` ]; then
  brew install dockutil
fi

dockutil --no-restart --remove all

dockutil --no-restart --add '/System/Applications/Launchpad.app'

dockutil --no-restart --add '/Applications/Safari.app'
dockutil --no-restart --add '/Applications/Firefox.app'

dockutil --no-restart --add '/Applications/Spotify.app'

dockutil --no-restart --add '/Applications/Notion.app'

dockutil --no-restart --add '/Applications/Slack.app'
dockutil --no-restart --add '/Applications/Telegram.app'

dockutil --no-restart --add '/Applications/iTerm.app'
dockutil --no-restart --add '/Applications/Visual Studio Code.app'

dockutil --no-restart --add '~/Developer'
dockutil --no-restart --add '~/Downloads'

killall Dock
