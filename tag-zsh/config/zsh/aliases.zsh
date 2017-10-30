# convenience
alias ls='ls -G'
alias Grep='grep'
alias hist='history'
alias his='history'

# ruby
alias be='bundle exec'

# rails
alias migrate='bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test'
alias rollback='bundle exec rake db:rollback; bundle exec rake db:rollback RAILS_ENV=test'
alias features='bundle exec rspec spec/features'

# git
alias g='git'
alias gut='git'
alias glog='g l'
alias gpom='g pull origin master'

# rcm
alias rcup='rcup -x setup'
alias rcupall="rcup `ls ~/.dotfiles/tag-* | sed 's/^tag-/-t /' | tr "\n" ' '`"
alias reload_zsh='source ~/.zshrc'
alias reload!='reload_zsh && rcupall'

# If need be, alias pbcopy and pbpaste to match the utilities in OSX. Lifted
# from - https://superuser.com/questions/288320/whats-like-osxs-pbcopy-for-linux
#
if ! (( $+commands[pbcopy] )); then
  alias pbcopy='xsel --clipboard --input'
fi

if ! (( $+commands[pbpaste] )); then
  alias pbpaste='xsel --clipboard --output'
fi

# transmission
alias t-start='sudo service transmission-daemon start'
alias t-stop='sudo service transmission-daemon stop'
alias t-reload='sudo service transmission-daemon reload'
alias t-list="transmission-remote -n '$TRANSMISSION_USER_NAME:$TRANSMISSION_USER_PASS' -l"
alias t-basicstats="transmission-remote -n '$TRANSMISSION_USER_NAME:$TRANSMISSION_USER_PASS' -st"
alias t-fullstats="transmission-remote -n '$TRANSMISSION_USER_NAME:$TRANSMISSION_USER_PASS' -si"
