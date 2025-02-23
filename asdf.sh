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

asdf plugin add nodejs
asdf install nodejs 22.14.0
asdf set -u nodejs 22.14.0

# asdf plugin add dart https://github.com/patoconnor43/asdf-dart.git
# asdf install dart 3.1
# asdf set -u dart 3.1

# asdf plugin add flutter
# asdf install flutter 3.29.0
# asdf set -u flutter 3.29.0

asdf plugin add python
asdf install python 3.13.2
asdf set -u python 3.13.2

# asdf plugin add golang https://github.com/kennyp/asdf-golang.git
# asdf install golang 1.24.0
# asdf set -u golang 1.24.0

# asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
# asdf install ruby 3.4.2
# asdf set -u ruby 3.4.2

source $HOME/.zshrc
