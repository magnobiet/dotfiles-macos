#!/bin/bash

if [ ! `which vagrant` ]; then

  brew install --cask vagrant
  brew install vagrant-completion
  brew install --cask vagrant-manager

fi

git clone https://github.com/laravel/homestead.git ~/Homestead && cd $_
git checkout release

bash init.sh

vagrant box add laravel/homestead
