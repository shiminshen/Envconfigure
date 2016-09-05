#! /bin/zsh

case `uname` in
  'Linux' )
    # install linuxbrew
    sudo apt-get install curl ruby
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    PATH="$HOME/.linuxbrew/bin:$PATH"
    ;;
  'Mac' )
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ;;
esac

brew install zsh tmux git git-extras
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo chsh -s $(which zsh)

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

# install stable node
nvm install stable

# install develope tools
npm install -g instant-markdown-d diff-so-fancy

# install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -fs "$PWD/vimrc" "$HOME/.vimrc"
ln -fs "$PWD/tmux.conf" "$HOME/.tmux.conf"
