#!/data/data/com.termux/files/usr/bin/bash

# Droid-GCLI: Automated Installer for Termux
# Repository: https://github.com/catamsp/Droid-GCLI

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions for logging
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

echo "=========================================="
echo -e "${BLUE}  Starting Gemini CLI Termux Installation ${NC}"
echo "=========================================="
echo ""

# Exit on any error
set -e

# Trap errors to provide helpfull context
trap 'log_error "An error occurred during installation. Please check the logs." && exit 1' ERR

# Ensure script is running in Termux
if [ -z "$PREFIX" ] || [[ "$PREFIX" != *"/com.termux/"* ]]; then
    log_error "This script is designed to run specifically in Termux on Android."
    exit 1
fi

log_info "Step 1: Updating package lists and upgrading installed packages..."
pkg update -y
pkg upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
log_success "Packages updated successfully."
echo ""

log_info "Step 2: Installing Node.js and npm..."
pkg install nodejs -y
log_success "Node.js and npm installed."
echo ""

log_info "Step 3: Installing Python and build essentials (required for native modules)..."
pkg install python build-essential -y
log_success "Build tools installed."
echo ""

log_info "Step 4: Configuring node-gyp environment..."
mkdir -p ~/.gyp
echo "{'variables':{'android_ndk_path':''}}" > ~/.gyp/include.gypi
log_success "Configuration applied successfully."
echo ""

log_info "Step 5: Installing the Gemini CLI globally..."
npm install -g @google/gemini-cli
log_success "Gemini CLI installed successfully."
echo ""

log_info "Step 6: Setting up shared storage access..."
log_warn "NOTICE: Please click 'Allow' on the Android permission popup if it appears."
# Setting up shared storage access directly
termux-setup-storage
sleep 2
log_success "Storage setup triggered."

echo ""

echo "=========================================="
echo -e "${GREEN}  Installation Complete!                  ${NC}"
echo "=========================================="
echo -e "1. Your phone's files are accessible in the ${YELLOW}~/storage${NC} folder."
echo -e "2. You can launch the CLI by typing: ${GREEN}gemini${NC}"
echo -e "3. To update the CLI in the future, run: ${YELLOW}npm update -g @google/gemini-cli${NC}"
