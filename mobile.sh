#!/bin/bash

pub global activate fvm

if ! grep -q ".pub-cache" "$HOME/.zshrc"; then
  echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> $HOME/.zshrc
fi

if ! grep -q "fvm/default/bin" "$HOME/.zshrc"; then
  echo 'export PATH="$PATH":"$HOME/fvm/default/bin"' >> $HOME/.zshrc
fi

pub global activate slidy
fvm install 1.22.6
fvm use 1.22.6 --global --force

flutter --version
flutter doctor
flutter doctor --android-licenses

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license
