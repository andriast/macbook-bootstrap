#!/bin/bash

check_step() {
  if [ $? -ne 0 ]; then
    echo "❌ Step failed. Try running manually: $1"
    exit 1
  fi
}

# React.js tooling and AWS Lambda setup

npm install -g create-react-app vite create-next-app eslint prettier
check_step "npm install -g create-react-app vite create-next-app eslint prettier"

brew install awscli
check_step "brew install awscli"
brew tap aws/tap
brew install aws-sam-cli
check_step "brew install aws-sam-cli"
npm install -g serverless
check_step "npm install -g serverless"

aws configure
check_step "aws configure"
