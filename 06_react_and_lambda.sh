#!/bin/bash

# -----------------------------------------
# React and AWS Lambda Dev Environment
# -----------------------------------------

echo "==> Installing React development tools..."

# Install create-react-app globally
npm install -g create-react-app

# Optionally install vite and next.js
npm install -g vite
npm install -g create-next-app

# ESLint and Prettier (global for now, can be local per project)
npm install -g eslint prettier

echo "==> Installing AWS CLI..."
brew install awscli

echo "==> Installing AWS SAM CLI (for local Lambda dev)..."
brew tap aws/tap
brew install aws-sam-cli

echo "==> (Optional) Installing Serverless Framework..."
npm install -g serverless

echo "==> Configuring AWS CLI (you will be prompted)..."
aws configure

echo "✅ React and AWS Lambda setup completed."
