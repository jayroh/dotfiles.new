alias be='bundle exec'

alias ls='ls -G'

alias g='git'

alias glog='g l'

alias gpom='g pull origin master'

alias Grep='grep'

alias hist='history'

alias rcup='rcup -x setup'
alias rcupall="rcup `ls ~/.dotfiles | grep tag | sed 's/^tag-/-t /' | tr "\n" ' '`"
alias reload_zsh='source ~/.zshrc'
alias reload!='reload_zsh && rcupall'

# Alias pbcopy and pbpaste to match the utilities in OSX. Lifted from -
# https://superuser.com/questions/288320/whats-like-osxs-pbcopy-for-linux
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
