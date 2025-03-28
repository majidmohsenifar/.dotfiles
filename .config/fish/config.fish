if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \cy accept-autosuggestion
end

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


#export GOROOT=/usr/lib/go
#export GOPATH=/home/majid/go
#export PATH=$PATH:$GOROOT/bin
#export PATH=$PATH:/home/majid/go/bin
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#export CARGO_NET_GIT_FETCH_WITH_CLI=true
#export BROWSER=/usr/bin/firefox
fish_add_path $HOME/.cargo/bin
#export PATH="/home/majid/.local/share/solana/install/active_release/bin:$PATH"
#export PATH="/home/majid/.avm/bin:$PATH"

#ulimit -n 90000


#[ -s "/home/majid/.scm_breeze/scm_breeze.sh" ] && source "/home/majid/.scm_breeze/scm_breeze.sh"
export FZF_DEFAULT_COMMAND="find -L"

# make sure the --git-dir is the same as the
# directory where you created the repo above.
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
