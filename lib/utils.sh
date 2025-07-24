#!/bin/bash

# =============================================================================
# Vim IDV Configuration - Shared Utility Functions
# =============================================================================
# This file contains shared functions used by installation scripts
# to reduce code duplication and improve maintainability.

# =============================================================================
# Color Constants
# =============================================================================
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly RED='\033[0;31m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# =============================================================================
# Logging and Output Functions
# =============================================================================

# Print status messages with green color
status() {
    local message="$1"
    echo -e "${GREEN}==>${NC} ${message}"
}

# Print informational messages with blue color
info() {
    local message="$1"
    echo -e "${BLUE}Info:${NC} ${message}"
}

# Print warning messages with yellow color
warning() {
    local message="$1"
    echo -e "${YELLOW}Warning:${NC} ${message}"
}

# Print error messages with red color and exit
error() {
    local message="$1"
    local exit_code="${2:-1}"
    echo -e "${RED}Error:${NC} ${message}" >&2
    exit "${exit_code}"
}

# Print debug messages (only if DEBUG is set)
debug() {
    local message="$1"
    if [[ "${DEBUG:-}" == "1" ]]; then
        echo -e "${BLUE}Debug:${NC} ${message}" >&2
    fi
}

# Print section headers
print_section() {
    local title="$1"
    local length=${#title}
    local border=$(printf '=%.0s' $(seq 1 $((length + 8))))
    
    echo
    echo -e "${GREEN}${border}${NC}"
    echo -e "${GREEN}=== ${title} ===${NC}"
    echo -e "${GREEN}${border}${NC}"
}

# =============================================================================
# System Utility Functions
# =============================================================================

# Check if a command exists
command_exists() {
    local cmd="$1"
    command -v "${cmd}" &> /dev/null
}

# Check if a file or directory exists
path_exists() {
    local path="$1"
    [[ -e "${path}" ]]
}

# Create a backup of a file with timestamp
backup_file() {
    local file_path="$1"
    local backup_suffix="${2:-backup}"
    
    if [[ -f "${file_path}" ]]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local backup_path="${file_path}.${backup_suffix}.${timestamp}"
        
        status "Creating backup: ${file_path} -> ${backup_path}"
        cp "${file_path}" "${backup_path}" || error "Failed to create backup of ${file_path}"
        echo "${backup_path}"
    fi
}

# Create directory if it doesn't exist
ensure_directory() {
    local dir_path="$1"
    local permissions="${2:-755}"
    
    if [[ ! -d "${dir_path}" ]]; then
        debug "Creating directory: ${dir_path}"
        mkdir -p "${dir_path}" || error "Failed to create directory: ${dir_path}"
        chmod "${permissions}" "${dir_path}"
    fi
}

# Clean up temporary directory
cleanup_temp_dir() {
    local temp_dir="$1"
    
    if [[ -n "${temp_dir}" && -d "${temp_dir}" ]]; then
        debug "Cleaning up temporary directory: ${temp_dir}"
        rm -rf "${temp_dir}"
    fi
}

# =============================================================================
# Installation Utility Functions
# =============================================================================

# Check system requirements
check_requirements() {
    local requirements=("$@")
    local missing=()
    
    for req in "${requirements[@]}"; do
        if ! command_exists "${req}"; then
            missing+=("${req}")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        error "Missing required dependencies: ${missing[*]}"
    fi
}

# Download file with retry logic
download_file() {
    local url="$1"
    local output_path="$2"
    local max_retries="${3:-3}"
    
    for ((i=1; i<=max_retries; i++)); do
        debug "Download attempt ${i}/${max_retries}: ${url}"
        
        if curl -fLo "${output_path}" --create-dirs "${url}"; then
            return 0
        fi
        
        if [[ ${i} -lt ${max_retries} ]]; then
            warning "Download failed, retrying in 2 seconds..."
            sleep 2
        fi
    done
    
    error "Failed to download ${url} after ${max_retries} attempts"
}

# Install vim-plug if not already installed
install_vim_plug() {
    local vim_plug_path="${HOME}/.vim/autoload/plug.vim"
    local vim_plug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    
    if [[ ! -f "${vim_plug_path}" ]]; then
        status "Installing vim-plug..."
        download_file "${vim_plug_url}" "${vim_plug_path}"
        info "vim-plug installed successfully"
    else
        debug "vim-plug already installed"
    fi
}

# Create vim directories
setup_vim_directories() {
    local vim_dirs=(
        "${HOME}/.vim/backup"
        "${HOME}/.vim/swap"
        "${HOME}/.vim/undo"
    )
    
    for dir in "${vim_dirs[@]}"; do
        ensure_directory "${dir}"
    done
    
    status "Vim data directories created"
}

# Install vim plugins
install_vim_plugins() {
    status "Installing vim plugins (this may take a moment)..."
    
    # Run vim in batch mode to install plugins
    if vim +PlugInstall +qall; then
        info "Vim plugins installed successfully"
    else
        warning "Some plugins may not have installed correctly"
    fi
}

# Prompt user for choice with validation
prompt_choice() {
    local prompt="$1"
    local choices="$2"
    local default="${3:-}"
    
    while true; do
        if [[ -n "${default}" ]]; then
            read -p "${prompt} [${default}]: " choice
            choice="${choice:-${default}}"
        else
            read -p "${prompt}: " choice
        fi
        
        if [[ "${choices}" == *"${choice}"* ]]; then
            echo "${choice}"
            return 0
        else
            warning "Invalid choice. Please select from: ${choices}"
        fi
    done
}

# =============================================================================
# Script Initialization
# =============================================================================

# Initialize logging and script environment
init_script() {
    local script_name="$1"
    
    # Set up error handling
    set -euo pipefail
    
    # Enable debug mode if requested
    if [[ "${DEBUG:-}" == "1" ]]; then
        set -x
    fi
    
    print_section "IDV's Vim Configuration - ${script_name}"
}

# =============================================================================
# Cleanup and Exit Handlers
# =============================================================================

# Set up cleanup trap for temporary files
setup_cleanup_trap() {
    local temp_dir="$1"
    
    trap "cleanup_temp_dir '${temp_dir}'" EXIT INT TERM
}