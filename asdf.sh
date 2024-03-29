#!/bin/bash

if [ ! `which gpg` ]; then
  brew install gpg
fi

if [ ! `which curl` ]; then
  brew install curl
fi

if [ ! `which unzip` ]; then
  brew install unzip
fi

if [ ! `which 7zz` ]; then
  brew install 7-zip
fi

brew install asdf

if ! grep -q "$(brew --prefix asdf)/asdf.sh" "$HOME/.zshrc"; then

  echo "
echo "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
" >> $HOME/.zshrc

fi

if ! grep -q "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" "$HOME/.zshrc"; then

  echo "
echo "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc
" >> $HOME/.zshrc

fi

source $HOME/.zshrc

asdf plugin-add nodejs
asdf install nodejs 18.12.1
asdf global nodejs 18.12.1

asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
asdf install dart 2.12.4
asdf global dart 2.12.4

asdf plugin-add flutter
asdf install flutter 3.3.7
asdf global flutter 3.3.7

asdf plugin-add python
asdf install python 3.11.0
asdf global python 3.11.0

asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang 1.19.3
asdf global golang 1.19.3

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.2.0
asdf global ruby 3.2.0

source $HOME/.zshrc
