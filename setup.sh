#!/bin/bash

case `uname` in
  'Linux' )
    # install essential tools
    sudo apt-get install -y vim zsh curl ruby
    # install dependency of youcompleteme
    sudo apt-get install -y build-essential cmake python-dev python3-dev
    # install linuxbrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    PATH="$HOME/.linuxbrew/bin:$PATH"
    echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bash_profile
    ;;
  'Darwin' )
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/damon/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew install zsh
    ;;
esac

brew install tmux git git-extras ag neovim ripgrep fd tig fig

# install font for vim
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

pip3 install pynvim


# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"

# install stable node
nvm install stable

# install develope tools
npm install -g instant-markdown-d diff-so-fancy nodemon npm-check-updates standard

# install tpm for tmux
git clone https://github.com/gpakosz/.tmux.git
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -fs "$PWD/vimrc" "$HOME/.vimrc"
ln -fs "$PWD/zshrc" "$HOME/.zshrc"
ln -fs "$PWD/nvim" "$HOME/.config/nvim"
ln -fs "$PWD/.tmux/.tmux.conf" "$HOME/.tmux.conf"

sudo chsh -s $(which zsh)

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

source ~/.zshrc
# install fzf-git
git clone https://github.com/hschne/fzf-git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-git


if [[ `uname`='Linux' ]]; then
  echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.zshrc
fi

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
