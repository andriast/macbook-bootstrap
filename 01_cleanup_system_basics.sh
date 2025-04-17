#!/bin/bash
echo "🧹 Cleaning up system basics..."
sudo rm -rf "$HOME/dev" "$HOME/Downloads/torrents" "$HOME/Desktop/screenshots"
echo "You may need to manually uninstall Xcode CLI tools and Rosetta if required."
