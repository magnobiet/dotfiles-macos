#!/bin/bash

brew install vim
brew install --cask iterm2

if [ ! `which zsh` ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! `which p10k` ]; then
  brew install romkatv/powerlevel10k/powerlevel10k
  echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
fi

# auto suggestions
AUTOSUGGESTIONS_PLUGIN_PATH=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [ ! -d $AUTOSUGGESTIONS_PLUGIN_PATH ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $AUTOSUGGESTIONS_PLUGIN_PATH
else
  cd $AUTOSUGGESTIONS_PLUGIN_PATH && git pull
fi

# syntax highlighting
SYNTAX_HIGHLIGHTING_PLUGIN_PATH=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

if [ ! -d $SYNTAX_HIGHLIGHTING_PLUGIN_PATH ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SYNTAX_HIGHLIGHTING_PLUGIN_PATH
else
  cd $SYNTAX_HIGHLIGHTING_PLUGIN_PATH && git pull
fi
