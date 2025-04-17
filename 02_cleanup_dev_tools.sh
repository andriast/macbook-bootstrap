#!/bin/bash
echo "🧹 Cleaning up development tools..."
brew uninstall --ignore-dependencies git zsh stow node watchman gradle android-sdk cocoapods react-native-cli docker mongodb-community@7.0 mongosh
brew uninstall --cask --force android-studio xcodes adoptopenjdk8 iterm2 docker
rm -rf ~/.android ~/Library/Android
