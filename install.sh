#!/bin/bash

# =============================================================================
# IDV's Vim Configuration - Installation Script
# =============================================================================
# This script installs the vim configuration with improved error handling,
# logging, and modularity using shared utility functions.

# Source shared utility functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/utils.sh
source "${SCRIPT_DIR}/lib/utils.sh" || {
    echo "Error: Cannot load utility functions from lib/utils.sh" >&2
    exit 1
}

# Initialize script
init_script "Installation Script"

# =============================================================================
# Main Installation Functions
# =============================================================================

# Check system requirements
check_requirements curl vim

# Backup existing configuration
backup_existing_config() {
    local vimrc_path="${HOME}/.vimrc"
    
    if [[ -f "${vimrc_path}" ]]; then
        backup_file "${vimrc_path}"
    fi
}

# Install vimrc configuration
install_vimrc() {
    local source_vimrc="${SCRIPT_DIR}/.vimrc"
    local target_vimrc="${HOME}/.vimrc"
    
    info "Installation options:"
    echo "1) Create a symlink (recommended for development)"
    echo "2) Copy the file (recommended for one-time installation)"
    
    local choice
    choice=$(prompt_choice "Choose an option (1/2)" "12" "1")
    
    case "${choice}" in
        1)
            status "Creating symlink for .vimrc"
            ln -sf "${source_vimrc}" "${target_vimrc}" || error "Failed to create symlink"
            info "Symlink created: ${target_vimrc} -> ${source_vimrc}"
            ;;
        2)
            status "Copying .vimrc file"
            cp "${source_vimrc}" "${target_vimrc}" || error "Failed to copy .vimrc"
            info "File copied: ${source_vimrc} -> ${target_vimrc}"
            ;;
        *)
            error "Invalid option selected"
            ;;
    esac
}

# =============================================================================
# Main Installation Process
# =============================================================================

main() {
    backup_existing_config
    install_vimrc
    install_vim_plug
    setup_vim_directories
    install_vim_plugins
    
    print_section "Installation Complete"
    info "Vim configuration installed successfully!"
    info "Start vim to begin using your new configuration."
    info "Tips:"
    echo "  - Use <C-f> to open file explorer"
    echo "  - Use ,f to fuzzy find files"
    echo "  - Run :Copilot setup to enable AI assistance"
    echo ""
    info "For troubleshooting, see README.md"
}

# =============================================================================
# Execute Main Installation
# =============================================================================

# Run the main installation function
main
