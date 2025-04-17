#!/bin/bash

# Install and configure NVM, Pyenv, ASDF

brew install nvm pyenv asdf

mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc

echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo '. /opt/homebrew/opt/asdf/libexec/asdf.sh' >> ~/.zshrc
