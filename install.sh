#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Installing IDV's Vim Configuration ===${NC}"

# Function to print status messages
status() {
    echo -e "${GREEN}==>${NC} $1"
}

# Function to print warnings
warning() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

# Function to print errors and exit
error() {
    echo -e "${RED}Error:${NC} $1"
    exit 1
}

# Create backup of existing .vimrc if it exists
if [ -f ~/.vimrc ]; then
    status "Creating backup of existing .vimrc to ~/.vimrc.backup"
    mv ~/.vimrc ~/.vimrc.backup || error "Failed to backup existing .vimrc"
fi

# Determine script location to handle running from any directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install options
status "How would you like to install the .vimrc file?"
echo "1) Create a symlink (recommended for development)"
echo "2) Copy the file (recommended for one-time installation)"
read -p "Choose an option (1/2): " install_option

case $install_option in
    1)
        status "Creating symlink for .vimrc"
        ln -sf "$SCRIPT_DIR/.vimrc" ~/.vimrc || error "Failed to create symlink"
        ;;
    2)
        status "Copying .vimrc file"
        cp "$SCRIPT_DIR/.vimrc" ~/.vimrc || error "Failed to copy .vimrc"
        ;;
    *)
        error "Invalid option. Please run the script again and select 1 or 2."
        ;;
esac

# Install vim-plug if not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    status "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || error "Failed to install vim-plug"
fi

# Create vim directories if they don't exist
mkdir -p ~/.vim/{backup,swap,undo} 2>/dev/null
status "Created vim data directories"

# Install plugins
status "Installing plugins (this may take a moment)..."
vim +PlugInstall +qall

# Final message
echo -e "\n${GREEN}====================================${NC}"
echo -e "${GREEN}Installation completed successfully!${NC}"
echo -e "${GREEN}====================================${NC}"
echo -e "You can now start vim and enjoy your new configuration."
echo -e "If you encounter any issues, check the README.md file for troubleshooting tips."
