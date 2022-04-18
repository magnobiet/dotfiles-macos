#!/bin/bash

pub global activate fvm

if ! grep -q ".pub-cache" "$HOME/.zshrc"; then
  echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> $HOME/.zshrc
fi

if ! grep -q "fvm/default/bin" "$HOME/.zshrc"; then
  echo 'export PATH="$PATH":"$HOME/fvm/default/bin"' >> $HOME/.zshrc
fi

pub global activate slidy
fvm install 2.0.2
fvm global 2.0.2

flutter --version
flutter doctor
flutter doctor --android-licenses

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license

if ! grep -q "# Android SDK" "$HOME/.zshrc"; then

  echo -e "
# Android SDK
export ANDROID_HOME=\$HOME/Library/Android/sdk
export PATH=\$PATH:\$ANDROID_HOME/emulator:\$PATH
export PATH=\$PATH:\$ANDROID_HOME/tools:\$PATH
export PATH=\$PATH:\$ANDROID_HOME/tools/bin:\$PATH
export PATH=\$ANDROID_HOME/platform-tools:\$PATH
" >> $HOME/.zshrc

fi
