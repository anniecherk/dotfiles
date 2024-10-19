#!/bin/bash

source ../shared_install_funcs.sh

# Update package lists
run_command "Updating package lists" "sudo apt update"

# ================================================================
# STEP ONE: great god this is an awful place, get me my shell!
# ================================================================
copy_config_files
setup_zsh

# Install zsh-autosuggestions
run_command "Installing zsh-autosuggestions" "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# ================================================================
# STEP TWO: time 4 nice to haves
# ================================================================
run_command "Installing autojump" "sudo apt install autojump -y"
run_command "Installing meld" "sudo apt install meld -y"
run_command "Installing wget" "sudo apt install wget -y"
run_command "Installing tldr" "sudo apt install tldr -y"
run_command "Installing jq" "sudo apt install jq -y"

# Print summary
print_summary "🐧"
