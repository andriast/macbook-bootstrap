#!/bin/bash
echo "🧹 Cleaning up environment managers..."
brew uninstall nvm pyenv asdf
rm -rf ~/.nvm ~/.pyenv ~/.asdf
