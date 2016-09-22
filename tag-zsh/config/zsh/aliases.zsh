alias be='bundle exec'

alias ls='ls -G'

alias g='git'

alias glog='g l'

alias gpom='g pull origin master'

alias Grep='grep'

alias hist='history'

alias rcup='rcup -x setup -t tag-zsh -t tag-nvim'

alias reload_zsh='source ~/.zshrc'
alias reload_rcup='ls ~/.dotfiles/ | cut -d- -f2 | xargs rcup -t'
alias reload!='reload_zsh && reload_rcup'

# Alias pbcopy and pbpaste to match the utilities in OSX. Lifted from -
# https://superuser.com/questions/288320/whats-like-osxs-pbcopy-for-linux
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
