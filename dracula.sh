#!/bin/bash

THEME_PATH=$HOME/Themes/Dracula

mkdir -p $THEME_PATH
cd $THEME_PATH

if [ ! -d "$THEME_PATH/ZSH" ]; then

  git clone https://github.com/dracula/zsh.git ZSH
  ln -s ~/Themes/Dracula/ZSH/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme

fi

if [ ! -d "$THEME_PATH/Xcode" ]; then

  git clone https://github.com/dracula/xcode.git Xcode

  mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
  ln -s ~/Themes/Dracula/Xcode/Dracula.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Dracula.xccolortheme

fi

if [ ! -d "$THEME_PATH/Terminal" ]; then
  git clone https://github.com/dracula/terminal-app.git Terminal

fi

if [ ! -d "$THEME_PATH/Vim" ]; then

  git clone https://github.com/dracula/vim.git Vim

  mkdir -p ~/.vim/pack/themes/start
  ln -s ~/Themes/Dracula/Vim ~/.vim/pack/themes/start/dracula

  echo "packadd! dracula" >> ~/.vimrc
  echo "syntax enable" >> ~/.vimrc
  echo "colorscheme dracula" >> ~/.vimrc

fi

if [ ! -d "$THEME_PATH/iTerm" ]; then

  git clone https://github.com/dracula/iterm.git iTerm

fi

if [ ! -d "$THEME_PATH/Telegram" ]; then

  git clone https://github.com/dracula/telegram.git Telegram

fi
