if [ -f "$HOME/.profile.secrets" ]; then
  source "$HOME/.profile.secrets"
fi

if [ -e "$HOME/.bin:$PATH" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  source "$(brew --prefix nvm)/nvm.sh"
fi

alias cdns="echo -e 'Clearing DNS cache...' && sudo killall -HUP mDNSResponder"
alias reload="echo -e 'Reloading shell profile...' && source $BASH_SOURCE"

alias dots="vcsh dots"
alias .dots="vcsh .dots"
