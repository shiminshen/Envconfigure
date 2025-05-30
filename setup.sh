#!/bin/bash

# MacOS
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/damon/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install zsh

# install powerlevel10k
# ref: https://github.com/romkatv/powerlevel10k#oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

brew install tmux git gh git-extras ag neovim ripgrep fd tig fig fzf bat yazi jesseduffield/lazygit/lazygit

# https://github.com/dlvhdr/gh-dash
gh extension install dlvhdr/gh-dash

# install ctag for vista (tagbar)
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

pip3 install pynvim

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"

# install stable node
nvm install stable

# install develope tools
npm install -g instant-markdown-d diff-so-fancy npm-check-updates opencommit

# install tpm for tmux
git clone https://github.com/gpakosz/.tmux.git
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -fs "$PWD/vimrc" "$HOME/.vimrc"
ln -fs "$PWD/zshrc" "$HOME/.zshrc"
ln -fs "$PWD/nvim" "$HOME/.config/nvim"
ln -fs "$PWD/.tmux/.tmux.conf" "$HOME/.tmux.conf"
# cp "$PWD/.tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"

sudo chsh -s $(which zsh)

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

source ~/.zshrc
# install fzf-git
git clone https://github.com/hschne/fzf-git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-git

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
