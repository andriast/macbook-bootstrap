#!/bin/bash
echo "🧹 Cleaning up GPG and SSH keys..."
rm -rf ~/.gnupg ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
ssh-add -D
