#!/bin/bash

brew install --cask iterm2

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

AUTOSUGGESTIONS_PLUGIN_PATH=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d $AUTOSUGGESTIONS_PLUGIN_PATH ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $AUTOSUGGESTIONS_PLUGIN_PATH
else
  cd $AUTOSUGGESTIONS_PLUGIN_PATH && git pull
fi

SYNTAX_HIGHLIGHTING_PLUGIN_PATH=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ ! -d $SYNTAX_HIGHLIGHTING_PLUGIN_PATH ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SYNTAX_HIGHLIGHTING_PLUGIN_PATH
else
  cd $SYNTAX_HIGHLIGHTING_PLUGIN_PATH && git pull
fi
