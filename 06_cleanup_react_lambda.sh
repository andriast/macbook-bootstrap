#!/bin/bash
echo "🧹 Cleaning up React and AWS Lambda tools..."
npm uninstall -g create-react-app vite create-next-app eslint prettier serverless
brew uninstall awscli aws-sam-cli
