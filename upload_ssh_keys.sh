#!/bin/bash

# -----------------------------------------------------------------------------
# Upload SSH Key to GitHub or Bitbucket
# -----------------------------------------------------------------------------

SSH_KEY_PATH="$HOME/.ssh/id_ed25519.pub"

if [ ! -f "$SSH_KEY_PATH" ]; then
  echo "❌ SSH key not found at $SSH_KEY_PATH"
  echo "Please run the main setup script first to generate one."
  exit 1
fi

echo "==> Where would you like to upload your SSH key?"
echo "1) GitHub"
echo "2) Bitbucket"
echo "3) Both"
read -p "Choose an option (1/2/3): " choice

if [[ "$choice" == "1" || "$choice" == "3" ]]; then
  echo "🔐 Uploading SSH key to GitHub..."
  read -p "Enter your GitHub username: " github_user
  read -s -p "Paste your GitHub Personal Access Token (admin:public_key scope): " github_token
  echo

  curl -u "$github_user:$github_token" \
    --data "{\"title\":\"MacBook Dev Key\",\"key\":\"$(cat $SSH_KEY_PATH)\"}" \
    https://api.github.com/user/keys
fi

if [[ "$choice" == "2" || "$choice" == "3" ]]; then
  echo "🔐 Uploading SSH key to Bitbucket..."
  read -p "Enter your Bitbucket username: " bitbucket_user
  read -s -p "Paste your Bitbucket App Password: " bitbucket_token
  echo

  curl -X POST -u "$bitbucket_user:$bitbucket_token" \
    -H "Content-Type: application/json" \
    -d "{\"label\": \"MacBook Dev Key\", \"key\": \"$(cat $SSH_KEY_PATH)\"}" \
    https://api.bitbucket.org/2.0/users/$bitbucket_user/ssh-keys
fi

echo "✅ SSH key upload process complete."
