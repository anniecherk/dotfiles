#!/bin/bash

source ../shared_install_funcs.sh

# won't get far w/out homebrew now will we
run_command "Installing Homebrew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# ================================================================
# STEP ONE: great god this is an awful place, get me my shell!
# ================================================================
copy_config_files
setup_zsh

# Install zsh-autosuggestions
run_command "Installing zsh-autosuggestions" "brew install zsh-autosuggestions"

# ================================================================
# STEP TWO: time 4 nice to haves
# ================================================================
run_command "Installing just" "brew install just"
run_command "Installing autojump" "brew install autojump"
run_command "Installing bat" "brew install bat"
run_command "Installing wget" "brew install wget"
run_command "Installing tldr" "brew install tldr"
run_command "Installing meld" "brew install meld"
run_command "Installing jq" "brew install jq"

# Install xcode
run_command "Installing xcode" "xcode-select --install"

# Print summary
print_summary "🍎"
