#!/bin/bash

SSH_KEY="$HOME/.ssh/id_ed25519.pub"
[ ! -f "$SSH_KEY" ] && echo "Missing SSH key" && exit 1

echo "1) GitHub
2) Bitbucket
3) Both"
read -p "Choose (1/2/3): " choice

if [[ "$choice" == "1" || "$choice" == "3" ]]; then
  read -p "GitHub username: " gh_user
  read -s -p "GitHub token: " gh_token
  echo
  curl -u "$gh_user:$gh_token" --data "{"title":"MacBook Dev Key","key":"$(cat $SSH_KEY)"}" https://api.github.com/user/keys
fi

if [[ "$choice" == "2" || "$choice" == "3" ]]; then
  read -p "Bitbucket username: " bb_user
  read -s -p "Bitbucket App Password: " bb_token
  echo
  curl -X POST -u "$bb_user:$bb_token" -H "Content-Type: application/json" -d "{"label": "MacBook Dev Key", "key": "$(cat $SSH_KEY)"}" https://api.bitbucket.org/2.0/users/$bb_user/ssh-keys
fi

echo "✅ Done"
