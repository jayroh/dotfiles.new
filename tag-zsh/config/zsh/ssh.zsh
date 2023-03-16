# If authorized_keys does not exist, create it
[[ ! -d ~/.ssh ]] && mkdir -p ~/.ssh
[[ ! -f ~/.ssh/authorized_keys ]] && touch ~/.ssh/authorized_keys

if [[ ! -S ~/.ssh/ssh_auth_sock ]]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

if ssh-add -l | grep -q "The agent has no identities"; then
  ssh-add
fi
