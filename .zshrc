# Created by newuser for 5.8
source /home/majid/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle docker 
antigen bundle minikube 

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

if [[ $TILIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi

export GOROOT=/usr/lib/go
export GOPATH=/home/majid/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/home/majid/go/bin
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export CARGO_NET_GIT_FETCH_WITH_CLI=true
export BROWSER=/usr/bin/firefox
export PATH=$PATH:$HOME/.cargo/bin
export PATH="/home/majid/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/home/majid/.avm/bin:$PATH"



#aliases
alias cde="cd ~/go/src/cex-golang"
alias cdb="cd ~/go/src/blockchain-transaction-service"
alias cdn="cd ~/go/src/new-shop-service"
alias cdcb="cd ~/go/src/connector-blockchain-service"
alias cdck="cd ~/go/src/connector-kyc-service"
alias cdcg="cd ~/go/src/connector-gateway-service"
alias cdcc="cd ~/go/src/connector-client-service"
alias cdci="cd ~/go/src/connector-invoice-service"
alias k=kubectl
alias nv=nvim 
alias cc=/home/majid/concordium-client_4.0.4-0
alias cat=bat
alias cdc="cd ~/go/src/corepass-auth-service"
alias cdr="cd ~/rust"

ulimit -n 90000

export FZF_DEFAULT_COMMAND="find -L"

# make sure the --git-dir is the same as the
# directory where you created the repo above.
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

[ -s "/home/majid/.scm_breeze/scm_breeze.sh" ] && source "/home/majid/.scm_breeze/scm_breeze.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
