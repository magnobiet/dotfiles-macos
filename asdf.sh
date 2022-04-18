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

if [ ! `which 7z` ]; then
  brew install 7z
fi

brew install asdf
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

source .zshrc

asdf plugin-add nodejs
asdf install nodejs 16.14.2
asdf global nodejs 16.14.2

asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
asdf install dart 2.12.4
asdf global dart 2.12.4

asdf plugin-add flutter
asdf install flutter 2.2.0
asdf global flutter 2.2.0

asdf plugin-add python
asdf install python 3.9.5
asdf global python 3.9.5

asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang 1.16.4
asdf global golang 1.16.4

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.0.1
asdf global ruby 3.0.1

source ~/.zshrc
