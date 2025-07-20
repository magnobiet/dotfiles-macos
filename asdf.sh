#!/bin/bash

for pkg in gpg curl unzip 7-zip asdf; do
  if ! command -v "${pkg}" >/dev/null 2>&1; then
    brew install "${pkg}"
  fi
done

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

if ! grep -q "/completions" "$HOME/.zshrc"; then
  mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"

  echo 'fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)' >> "$HOME/.zshrc"
  echo 'autoload -Uz compinit && compinit' >> "$HOME/.zshrc"
fi

if ! asdf plugin-list | grep -q "nodejs"; then
  asdf plugin add nodejs
fi

asdf install nodejs 22.17.1
asdf global nodejs 22.17.1

# Add and install python plugin/version if not present
if ! asdf plugin-list | grep -q "python"; then
  asdf plugin add python
fi

asdf install python 3.13.5
asdf global python 3.13.5

echo "Setup completed. Please restart your terminal."
