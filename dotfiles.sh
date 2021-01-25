#!/bin/bash

FILES="aliases functions editorconfig gitconfig gitignore gitmessage npmrc"

for file in $FILES; do

  if [ -f "$HOME/.$file" ]; then
    mv $HOME/.$file $HOME/.$file.backup
  fi

  cp $HOME/.dotfiles/files/$file $HOME/.$file

done

if ! grep -q "Magno's dotfiles" "$HOME/.zshrc"; then

  echo "
# Magno's dotfiles
if [ -f ~/.functions ]; then
  . ~/.functions
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi" >> $HOME/.zshrc

fi

curl 'https://vim-bootstrap.com/generate.vim' --data 'langs=html&langs=javascript&langs=php&langs=typescript&theme=dracula&editor=vim' > ~/.vimrc
