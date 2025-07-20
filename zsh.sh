#!/bin/bash

set -e

brew install --cask iterm2

for pkg in vim starship zsh; do
  if ! command -v $pkg >/dev/null 2>&1; then
    brew install $pkg
  fi
done

if ! grep -q 'starship' "$HOME/.zshrc"; then
  echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

AUTOSUGGESTIONS_PLUGIN_PATH="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
if [ ! -d "$AUTOSUGGESTIONS_PLUGIN_PATH" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGESTIONS_PLUGIN_PATH"
else
  git -C "$AUTOSUGGESTIONS_PLUGIN_PATH" pull
fi

SYNTAX_HIGHLIGHTING_PLUGIN_PATH="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_HIGHLIGHTING_PLUGIN_PATH" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING_PLUGIN_PATH"
else
  git -C "$SYNTAX_HIGHLIGHTING_PLUGIN_PATH" pull
fi
