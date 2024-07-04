## A verbose bash script to install common tooling
## These commands might fail but if they do they provide visibility into what is missing


# Announce installing homebrew, and complain if it fails
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "Homebrew install failed"


# Install Homebrew packages
echo "Installing Homebrew packages"

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


# Install xcode
echo "Installing xcode"
xcode-select --install || echo "xcode install failed"

# zsh setup
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo "zsh setup failed"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions"
brew install zsh-autosuggestions || echo "zsh-autosuggestions install failed"


# Install zsh-git-plugin
echo "Installing zsh-git-plugin"
brew install zsh-git-plugin || echo "zsh-git-plugin install failed"

# Installing github CLI
echo "Installing github CLI"
brew install gh || echo "gh install failed"

# we did it!
echo "✅ Done 🌞"