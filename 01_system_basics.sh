#!/bin/bash

# System basics: Xcode CLI, Homebrew, Rosetta, Folders

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "==> Creating dev folder structure..."
mkdir -p "$HOME/dev" "$HOME/Downloads/torrents" "$HOME/Desktop/screenshots"

echo "==> Installing Xcode Command Line Tools..."
if ! xcode-select --print-path &> /dev/null; then
  xcode-select --install
  until xcode-select --print-path &> /dev/null; do sleep 5; done
fi

echo "==> Installing Rosetta..."
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "==> Installing Homebrew..."
if ! command -v "brew" &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update
