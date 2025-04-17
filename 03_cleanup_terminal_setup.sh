#!/bin/bash
echo "🧹 Cleaning up terminal setup..."
rm -rf ~/.oh-my-zsh ~/.p10k.zsh ~/.aliases ~/.zshrc
brew uninstall romkatv/powerlevel10k/powerlevel10k
brew uninstall --cask font-meslo-lg-nerd-font
