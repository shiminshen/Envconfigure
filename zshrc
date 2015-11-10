#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR='vim'
# alias
alias tmux='tmux -2'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

# Homebrew setup
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# Customize to your needs...
source "$HOME/.antigen/antigen.zsh"


# antigen settings
antigen bundle git
antigen bundle tmux
antigen bundle node
antigen bundle git-extras

antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle rupa/z
antigen bundle Tarrasch/zsh-autoenv
antigen bundle sharat87/zsh-vim-mode
# antigen bundle b4b4r07/enhancd
antigen bundle rimraf/k

export NVM_DIR="/home/smshen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
eval $(thefuck --alias)
