#!/bin/bash

set -e  # Exit on any error

echo "Setting up development environment for macOS..."

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install oh-my-zsh first (required for themes)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi

# Install powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Install system packages
echo "Installing system packages via Homebrew..."
brew install zsh tmux git gh git-extras ag neovim ripgrep fd jq tig fig fzf bat yazi jesseduffield/lazygit/lazygit sad tree-sitter rust

# Install modern CLI tools (replacements for traditional commands)
echo "Installing modern CLI tools..."
# eza: modern replacement for ls with colors and icons
# git-delta: better git diff viewer with syntax highlighting
# zoxide: smart cd command that learns your habits
# dust: modern du with better visualization
# duf: modern df with prettier output
# procs: modern ps with better formatting
# bottom: modern top/htop with better UI
brew install eza git-delta zoxide dust duf procs bottom

# Install packages for Neovim Snacks plugin functionality
echo "Installing packages for Neovim Snacks plugin..."
# imagemagick: Required for image conversion and display in Snacks.image
# ghostscript: Required for PDF rendering in Snacks.image
brew install imagemagick ghostscript


# Install universal-ctags
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Install GitHub CLI extensions
gh extension install dlvhdr/gh-dash

# Configure git-delta
echo "Configuring git-delta..."
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.light false

# Configure lazygit to use delta
echo "Configuring lazygit to use delta..."
mkdir -p ~/.config/lazygit
cat > ~/.config/lazygit/config.yml << 'EOF'
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
EOF

# Configure tig to use delta (with key bindings)
echo "Configuring tig to use delta..."
cat > ~/.tigrc << 'EOF'
# Delta integration for tig
# Press 'D' to show diff with delta
# Press 'S' to show diff with delta in side-by-side mode
bind diff D >sh -c "git show %(commit) | delta --paging always"
bind diff S >sh -c "git show %(commit) | delta --paging always --side-by-side"
bind stage D >sh -c "git diff HEAD -- %(file) | delta --paging always"
bind stage S >sh -c "git diff HEAD -- %(file) | delta --paging always --side-by-side"
bind status D >sh -c "git diff HEAD -- %(file) | delta --paging always"
bind status S >sh -c "git diff HEAD -- %(file) | delta --paging always --side-by-side"
EOF

# Install Python dependencies
if command -v pip3 >/dev/null 2>&1; then
    echo "Installing Python dependencies..."
    pip3 install pynvim
else
    echo "Warning: pip3 not found, skipping Python dependencies"
fi

# Install nvm and Node.js
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install and use stable Node.js
nvm install stable
nvm use stable

# Install Node.js global packages
echo "Installing Node.js development tools..."
npm install -g instant-markdown-d diff-so-fancy npm-check-updates opencommit @biomejs/biome

# Install Mermaid CLI for diagram rendering in Neovim Snacks plugin
echo "Installing Mermaid CLI for diagram rendering..."
# @mermaid-js/mermaid-cli: Required for rendering Mermaid diagrams in Snacks.image
npm install -g @mermaid-js/mermaid-cli

# Clone tmux configuration
if [ ! -d ".tmux" ]; then
    echo "Cloning tmux configuration..."
    git clone https://github.com/gpakosz/.tmux.git
fi

# Create symbolic links for configuration files
echo "Creating symbolic links..."
ln -fs "$PWD/vimrc" "$HOME/.vimrc"
ln -fs "$PWD/zshrc" "$HOME/.zshrc"
ln -fs "$PWD/nvim" "$HOME/.config/nvim"
ln -fs "$PWD/.tmux/.tmux.conf" "$HOME/.tmux.conf"

# Install fzf-git plugin
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-git" ]; then
    echo "Installing fzf-git plugin..."
    git clone https://github.com/hschne/fzf-git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-git"
fi

# Update .zshrc with NVM configuration if not already present
if ! grep -q "NVM_DIR" ~/.zshrc; then
    echo "Adding NVM configuration to .zshrc..."
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
fi

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    sudo chsh -s $(which zsh)
fi

echo "Setup completed! Please restart your terminal or run 'source ~/.zshrc' to apply changes."
