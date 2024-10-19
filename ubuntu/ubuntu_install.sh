#!/bin/bash

# Initialize associative arrays to store command results and error messages
declare -A results
declare -A error_messages

# Function to run a command and store its result and error message
run_command() {
    local description=$1
    local command=$2
    echo "$description"
    error_output=$(eval "$command" 2>&1 >/dev/null)
    if [ $? -eq 0 ]; then
        results["$description"]="✅ hell yeah"
    else
        results["$description"]="❌ hell no"
        error_messages["$description"]="$error_output"
        echo "$description failed"
    fi
}

# Update package lists
run_command "Updating package lists" "sudo apt update"

# ================================================================
# STEP ONE: great god this is an awful place, get me my shell!
# ================================================================

# STEP ONE: Copy configuration files
run_command "Adding my aliases" "cp ../.aliases ~/.aliases"
run_command "Adding my vimrc" "cp ../.vimrc ~/.vimrc"
run_command "Adding my gitconfig" "cp ../.gitconfig ~/.gitconfig"
run_command "Adding my bash_profile" "cp ../.bash_profile ~/.bash_profile"
run_command "Adding my bashrc" "cp ../.bashrc ~/.bashrc"
run_command "Adding my .paths" "cp ../.paths ~/.paths"

# Now set up zsh!

# Install oh-my-zsh
run_command "Installing oh-my-zsh" "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""

# add my zshrc
run_command "Adding my zshrc" "cp .zshrc ~/.zshrc"

# Install zsh-autosuggestions
run_command "Installing zsh-autosuggestions" "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# ================================================================
# STEP TWO: time 4 nice to haves
# ================================================================


# Install just
# echo "Installing just"
# you can sudo apt install just starting with Ubuntu 24.04
# sudo apt install just -y || echo "just install failed"
# for older version you can use the following:
# git clone https://mpr.makedeb.org/just && cd just && makedeb -si
# ^ commenting out for now b/c you have to manually install makedeb first augh

# STEP TWO: Install additional tools
run_command "Installing autojump" "sudo apt install autojump -y"
run_command "Installing meld" "sudo apt install meld -y"
run_command "Installing wget" "sudo apt install wget -y"
run_command "Installing tldr" "sudo apt install tldr -y"
run_command "Installing jq" "sudo apt install jq -y"

# Print summary
echo -e "\n🌟💃🕺 Installation Summary 🐧"
echo "================================="
for description in "${!results[@]}"; do
    printf "%-30s : %s\n" "$description" "${results[$description]}"
done

# Print error messages for failed commands
echo -e "\n❌ Error Details:"
echo "================="
for description in "${!error_messages[@]}"; do
    if [[ ${results[$description]} == *"Failed"* ]]; then
        echo -e "\n$description:"
        echo "${error_messages[$description]}"
    fi
done

echo -e "\nDone! 🎉"
