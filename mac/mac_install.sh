#!/bin/bash

# Initialize associative arrays to store command results and error messages
declare -A results
declare -A error_messages

# Function to run a command and store its result and error message
run_command() {
    local description=$1
    local command=$2
    echo "$description"
    error_output=$(eval "$command" 2>&1)
    if [ $? -eq 0 ]; then
        results["$description"]="✅ hell yeah"
    else
        results["$description"]="❌ hell no"
        error_messages["$description"]="$error_output"
        echo "$description failed"
    fi
}

# Not going to get very far without homebrew, huh
run_command "Installing Homebrew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# ================================================================
# STEP ONE: great god this is an awful place, get me my shell!
# ================================================================

run_command "Adding my aliases" "cp ../.aliases ~/.aliases"
run_command "Adding my vimrc" "cp ../.vimrc ~/.vimrc"
run_command "Adding my gitconfig" "cp ../.gitconfig ~/.gitconfig"
run_command "Adding my bash_profile" "cp ../.bash_profile ~/.bash_profile"
run_command "Adding my bashrc" "cp ../.bashrc ~/.bashrc"
run_command "Adding my .paths" "cp ../.paths ~/.paths"

# Now set up zsh!

# zsh setup
run_command "Installing oh-my-zsh" 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

# Install zsh-autosuggestions
run_command "Installing zsh-autosuggestions" "brew install zsh-autosuggestions"

# add my zshrc
run_command "Adding my zshrc" "cp .zshrc ~/.zshrc"

# ================================================================
# STEP TWO: time 4 nice to haves
# ================================================================

# Install just
run_command "Installing just" "brew install just"

# Install autojump
run_command "Installing autojump" "brew install autojump"

# Install bat
run_command "Installing bat" "brew install bat"

# Install wget
run_command "Installing wget" "brew install wget"

# Install tldr
run_command "Installing tldr" "brew install tldr"

# Install meld
run_command "Installing meld" "brew install meld"

# Install jq
run_command "Installing jq" "brew install jq"

# not a nice to have, really going to need xcode
# Install xcode
run_command "Installing xcode" "xcode-select --install"

# Print summary
echo -e "\n🌟💃🕺 Installation Summary 🍎"
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

echo -e "\n🌞 Done! 💃🕺✨"
