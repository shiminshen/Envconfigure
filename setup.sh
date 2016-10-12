#!/bin/bash

case `uname` in
  'Linux' )
    # install essential tools
    sudo apt-get install -y zsh curl ruby
    # install dependency of youcompleteme
    sudo apt-get install -y build-essential cmake python-dev python3-dev
    # install linuxbrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    PATH="$HOME/.linuxbrew/bin:$PATH"
    echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
    ;;
  'Mac' )
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install zsh
    ;;
esac

brew install tmux git git-extras ag fzf

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"

# install stable node
nvm install stable

# install develope tools
npm install -g instant-markdown-d diff-so-fancy nodemon

# install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -fs "$PWD/vimrc" "$HOME/.vimrc"
ln -fs "$PWD/tmux-config/.tmux.conf" "$HOME/.tmux.conf"

sudo chsh -s $(which zsh)

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ `uname`='Linux' ]]; then
  echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.zshrc
fi

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
