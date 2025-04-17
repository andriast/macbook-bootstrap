#!/bin/bash

# React.js tooling and AWS Lambda setup

npm install -g create-react-app vite create-next-app eslint prettier

brew install awscli
brew tap aws/tap
brew install aws-sam-cli
npm install -g serverless

aws configure
