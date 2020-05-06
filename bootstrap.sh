#!/bin/bash

# Install dependencies using Homebrew with Brewfile
echo "Install dependencies using Homebrew with Brewfile"
brew bundle

# Generate source code by Sourcery
echo "Generate source code by Sourcery"
sourcery

# Done! Open your workspace
echo "Done!"
open NotAutoLayout.xcworkspace
