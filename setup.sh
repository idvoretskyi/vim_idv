#!/bin/bash

# =============================================================================
# IDV's Vim Configuration - Remote Setup Script
# =============================================================================
# This script downloads and installs the vim configuration from GitHub.
# It's designed to be run directly from curl or as a standalone script.

# =============================================================================
# Minimal Utility Functions (for standalone operation)
# =============================================================================

# Colors for terminal output
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly RED='\033[0;31m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Print status messages
status() {
    echo -e "${GREEN}==>${NC} $1"
}

# Print info messages
info() {
    echo -e "${BLUE}Info:${NC} $1"
}

# Print warning messages
warning() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

# Print errors and exit
error() {
    local message="$1"
    local exit_code="${2:-1}"
    echo -e "${RED}Error:${NC} ${message}" >&2
    exit "${exit_code}"
}

# Print section header
print_header() {
    echo
    echo -e "${GREEN}================================================${NC}"
    echo -e "${GREEN}  IDV's Vim Configuration - Remote Setup${NC}"
    echo -e "${GREEN}================================================${NC}"
    echo
}

# =============================================================================
# Configuration and Constants
# =============================================================================

readonly REPO_URL="https://github.com/idvoretskyi/vim_idv.git"
readonly REPO_NAME="vim_idv"

# =============================================================================
# Setup Functions
# =============================================================================

# Check system requirements
check_system_requirements() {
    local requirements=("git" "vim" "curl")
    local missing=()
    
    for req in "${requirements[@]}"; do
        if ! command -v "${req}" &> /dev/null; then
            missing+=("${req}")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        error "Missing required dependencies: ${missing[*]}\nPlease install them and run this script again."
    fi
    
    info "System requirements check passed"
}

# Create and setup temporary directory
setup_temp_directory() {
    local temp_dir
    temp_dir=$(mktemp -d) || error "Failed to create temporary directory"
    
    # Set up cleanup trap
    trap "cleanup_installation '${temp_dir}'" EXIT INT TERM
    
    status "Created temporary directory: ${temp_dir}"
    echo "${temp_dir}"
}

# Clone repository to temporary directory
clone_repository() {
    local temp_dir="$1"
    local target_dir="${temp_dir}/${REPO_NAME}"
    
    status "Cloning repository from ${REPO_URL}..."
    
    if git clone "${REPO_URL}" "${target_dir}"; then
        info "Repository cloned successfully"
        echo "${target_dir}"
    else
        error "Failed to clone repository from ${REPO_URL}"
    fi
}

# Run the installation script
run_installation() {
    local repo_dir="$1"
    local install_script="${repo_dir}/install.sh"
    
    if [[ ! -f "${install_script}" ]]; then
        error "Installation script not found: ${install_script}"
    fi
    
    # Make script executable
    chmod +x "${install_script}" || error "Failed to make install script executable"
    
    status "Starting installation process..."
    
    # Change to repository directory and run install script
    if (cd "${repo_dir}" && ./install.sh); then
        info "Installation completed successfully"
    else
        error "Installation failed"
    fi
}

# Cleanup temporary files
cleanup_installation() {
    local temp_dir="$1"
    
    if [[ -n "${temp_dir}" && -d "${temp_dir}" ]]; then
        status "Cleaning up temporary files..."
        rm -rf "${temp_dir}"
    fi
}

# =============================================================================
# Main Setup Process
# =============================================================================

main() {
    print_header
    
    # Check system requirements
    check_system_requirements
    
    # Setup temporary directory
    local temp_dir
    temp_dir=$(setup_temp_directory)
    
    # Clone repository
    local repo_dir
    repo_dir=$(clone_repository "${temp_dir}")
    
    # Run installation
    run_installation "${repo_dir}"
    
    # Success message
    echo
    echo -e "${GREEN}================================================${NC}"
    echo -e "${GREEN}  Setup Complete!${NC}"
    echo -e "${GREEN}================================================${NC}"
    info "Vim configuration installed successfully!"
    info "Start vim to begin using your enhanced development environment."
    echo
}

# =============================================================================
# Script Execution
# =============================================================================

# Run main function if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    set -euo pipefail  # Enable strict error handling
    main "$@"
fi
