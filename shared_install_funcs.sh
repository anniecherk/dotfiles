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

# Function to copy configuration files
# note the relative import here is a bit goofy: it's meant to run from
# one of the two OS-specific directories
copy_config_files() {
    run_command "Adding my aliases" "cp ../.aliases ~/.aliases"
    run_command "Adding my vimrc" "cp ../.vimrc ~/.vimrc"
    run_command "Adding my gitconfig" "cp ../.gitconfig ~/.gitconfig"
    run_command "Adding my bash_profile" "cp ../.bash_profile ~/.bash_profile"
    run_command "Adding my bashrc" "cp ../.bashrc ~/.bashrc"
    run_command "Adding my .paths" "cp ../.paths ~/.paths"
}

# Function to set up zsh
setup_zsh() {
    run_command "Installing oh-my-zsh" 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
    run_command "Adding my zshrc" "cp .zshrc ~/.zshrc"
}

# Function to print summary
print_summary() {
    echo -e "\n🌟💃🕺 Installation Summary $1"
    echo "================================="
    for description in "${!results[@]}"; do
        printf "%-30s : %s\n" "$description" "${results[$description]}"
    done

    echo -e "\n❌ Error Details:"
    echo "================="
    for description in "${!error_messages[@]}"; do
        if [[ ${results[$description]} == *"Failed"* ]]; then
            echo -e "\n$description:"
            echo "${error_messages[$description]}"
        fi
    done

    echo -e "\n🌞 Done! 💃🕺✨"
}
