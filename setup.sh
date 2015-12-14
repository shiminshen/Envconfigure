#! /bin/zsh

# install develope tools
brew install zsh tmux

# install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -fs "$PWD/vimrc" "$HOME/.vimrc"
ln -fs "$PWD/tmux.conf" "$HOME/.tmux.conf"
