#!/bin/bash

if ! command -v dockutil >/dev/null 2>&1; then
  brew install dockutil
fi

dockutil --no-restart --remove all

dockutil --no-restart --add '/System/Applications/Launchpad.app'
dockutil --no-restart --add '/Applications/Brave Browser.app'
dockutil --no-restart --add '/Applications/iTerm.app'
dockutil --no-restart --add '/Applications/Visual Studio Code.app'
dockutil --no-restart --add "$HOME/Developer"
dockutil --no-restart --add "$HOME/Downloads"

killall Dock
