#!/bin/bash

# Core dev tools: Git, Node, Mongo, Docker, Mobile SDKs

brew install git zsh stow node watchman gradle android-sdk cocoapods react-native-cli docker mongodb-community@7.0 mongosh
brew install --cask android-studio xcodes adoptopenjdk8 iterm2 docker

ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

sdkmanager --update
touch ~/.android/repositories.cfg
sdkmanager "system-images;android-29;google_apis;x86"
sdkmanager --licenses
echo "no" | avdmanager create avd -n test_device -k "system-images;android-29;google_apis;x86" --force

echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> ~/.zprofile
echo 'export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools' >> ~/.zprofile
source ~/.zprofile
