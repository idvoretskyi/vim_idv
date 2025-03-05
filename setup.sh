#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print errors and exit
error() {
    echo -e "${RED}Error:${NC} $1"
    exit 1
}

# Function to print status messages
status() {
    echo -e "${GREEN}==>${NC} $1"
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    error "Git is required but not installed. Please install git first."
fi

# Create temporary directory for the installation
TMP_DIR=$(mktemp -d)
status "Created temporary directory for installation: $TMP_DIR"

# Clone the repository
status "Cloning the vim_idv repository..."
git clone https://github.com/idvoretskyi/vim_idv.git "$TMP_DIR" || error "Failed to clone the repository"

# Change to the repository directory
cd "$TMP_DIR" || error "Failed to enter the repository directory"

# Make the install script executable
chmod +x install.sh || error "Failed to make the install script executable"

# Run the install script
status "Starting the installation process..."
./install.sh

# Clean up
status "Cleaning up temporary files..."
cd - > /dev/null
rm -rf "$TMP_DIR"

status "Installation complete! Enjoy your new Vim configuration."
