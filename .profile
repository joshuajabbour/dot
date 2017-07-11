if [ -f "$HOME/.profile.secrets" ]; then
  source "$HOME/.profile.secrets"
fi

if [ -e "$HOME/.bin:$PATH" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -f "/usr/local/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  source "$(brew --prefix nvm)/nvm.sh"
fi

alias cdns="echo -e 'Clearing DNS cache...' && sudo killall -HUP mDNSResponder"
alias dots="vcsh dots"
alias reload="echo -e 'Reloading current shell profile...' && source $HOME/.profile"
