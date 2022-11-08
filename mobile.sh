#!/bin/bash

dart pub global activate slidy

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
