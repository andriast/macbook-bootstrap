#!/bin/bash

# GPG + SSH key setup for GitHub/Bitbucket

echo "==> Generating GPG key..."
gpg --batch --gen-key <<EOF
Key-Type: default
Key-Length: 4096
Subkey-Type: default
Name-Real: $USER
Name-Email: $(git config --global user.email)
Expire-Date: 0
%no-protection
%commit
EOF

KEYID=$(gpg --list-secret-keys --keyid-format=long | grep sec | awk '{print $2}' | cut -d'/' -f2)
git config --global user.signingkey $KEYID
git config --global commit.gpgsign true

ssh-keygen -t ed25519 -C "$(git config --global user.email)" -f ~/.ssh/id_ed25519 -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub
