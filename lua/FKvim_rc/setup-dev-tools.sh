#!/bin/bash

# Web
npm install -g prettier eslint_d

# Python
pip install black flake8

# Java Formatter
brew install google-java-format 2>/dev/null || echo "Install google-java-format manually"

# Kotlin Linter
brew install ktlint 2>/dev/null || echo "Install ktlint manually if needed"

echo "✅ All tools installed! Restart Neovim and format away 🎯"

