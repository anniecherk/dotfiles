#!/bin/bash

# Not going to get very far without homebrew, huh
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "Homebrew install failed"

# ================================================================
# STEP ONE: great god this is an awful place, get me dot files!
# ================================================================

echo "Adding my aliases"
cp .aliases ~/.aliases  

echo "Adding my vimrc"
cp .vimrc ~/.vimrc

echo "Adding my gitconfig"
cp .gitconfig ~/.gitconfig

echo "Adding my bash_profile"
cp .bash_profile ~/.bash_profile

echo "Adding my bashrc"
cp .bashrc ~/.bashrc

echo "Adding my .paths"
cp .paths ~/.paths

# Now set up zsh!

# zsh setup
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo "zsh setup failed"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions"
brew install zsh-autosuggestions || echo "zsh-autosuggestions install failed"

# add my zshrc
echo "Adding my zshrc"
cp .zshrc ~/.zshrc

# ================================================================
# STEP TWO: time 4 nice to haves
# ================================================================

# Install just
echo "Installing just"
brew install just || echo "just install failed"

# Install autojump
echo "Installing autojump"
brew install autojump || echo "autojump install failed"

# Install bat
echo "Installing bat"
brew install bat || echo "bat install failed"

# Install wget
echo "Installing wget"
brew install wget || echo "wget install failed"

# Install tldr
echo "Installing tldr"
brew install tldr || echo "tldr install failed"

# Install meld
echo "Installing meld"
brew install meld || echo "meld install failed"

# Install jq
echo "Installing jq"
brew install jq || echo "jq install failed"

# not a nice to have, really going to need xcode
# Install xcode
echo "Installing xcode"
xcode-select --install || echo "xcode install failed"

# we did it!
echo "🌞 Done! 💃🕺✨"