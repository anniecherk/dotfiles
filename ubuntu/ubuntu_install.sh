#!/bin/bash

# assuming we have git & curl installed
# Update package lists
echo "Updating package lists"
sudo apt update || echo "Package list update failed"


# ================================================================
# STEP ONE: great god this is an awful place, get me oh-my-zsh!
# ================================================================

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo "oh-my-zsh install failed"

# add my zshrc
echo "Adding my zshrc"
cp .zshrc ~/.zshrc

# install zsh-autosuggestions
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || echo "zsh-autosuggestions install failed"
# zsh-autosuggestions needs to be added to path, but it's already in my zshrc


# ================================================================
# STEP TWO: time 4 nice to haves
# ================================================================


# Install just
# echo "Installing just"
# you can sudo apt install just starting with Ubuntu 24.04
# sudo apt install just || echo "just install failed"
# for older version you can use the following:
# git clone https://mpr.makedeb.org/just && cd just && makedeb -si

# Install autojump
echo "Installing autojump"
sudo apt install autojump || echo "autojump install failed"
# autojump needs to be added to path, but it's already in my zshrc

# Install bat (batcat on Ubuntu)
# bat has an unpatched vuln on 20 & 22... nice. let's skip
# echo "Installing bat"
# sudo apt install bat || echo "bat install failed"

# Install meld
echo "Installing meld"
sudo apt install meld || echo "meld install failed"

# Install wget
echo "Installing wget"
sudo apt install wget || echo "wget install failed"

# Install tldr
echo "Installing tldr"
sudo apt install tldr || echo "tldr install failed"

# Install jq
echo "Installing jq"
sudo apt install jq -y || echo "jq install failed"


# We did it!
echo "🌟💃🕺 Done! 🐧"

